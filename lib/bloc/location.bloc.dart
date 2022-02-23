import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:foodie_delivery_boy/bloc/base.bloc.dart';
import 'package:foodie_delivery_boy/data/models/dialog_data.dart';
import 'package:foodie_delivery_boy/data/models/user.dart';
import 'package:foodie_delivery_boy/data/repositories/location.repository.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationBloc extends BaseBloc {
  //

  LocationRepository _locationRepository = new LocationRepository();
  //
  SharedPreferences preferences;
  BehaviorSubject<bool> _isOnline = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isOnline => _isOnline.stream;

  //
  Location location = new Location();
  LocationData currentLocation;
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  DatabaseReference deliveryBoyLocationRef;
  User currentUser;

  @override
  void initBloc() async {
    super.initBloc();

    //fetch current user data
    currentUser = await appDatabase.userDao.findCurrent();

    //referenncing delivery boy location node on the firebase database
    deliveryBoyLocationRef = FirebaseDatabase.instance
        .reference()
        .child("locations")
        .child(currentUser.id.toString());

    preferences = await SharedPreferences.getInstance();
    bool online = (preferences.getBool('online') ?? false);
    _isOnline.add(online);

    //start the location listening
    await _locationUpdate();
  }

  //
  void updateOnlineStatus(bool status) async {
    //show loading sign
    _isOnline.add(null);
    //send the update to server
    final resultDialogData = await _locationRepository.updateOnlineStatus(
      online: status ? 1 : 0,
    );

    if (resultDialogData.dialogType == DialogType.success) {
      _isOnline.add(status);
      preferences.setBool("online", status);
    } else {
      _isOnline.add(!status);
    }
  }

  //
  toggleOnlineStatus() async {
    final currentStatus = _isOnline.value ?? false;
    await updateOnlineStatus(!currentStatus);
  }

  //
  void _locationUpdate() async {
    //check if location service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    //ask for location permission if not given
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    //change the settings used in geting the new device location
    location.changeSettings(
      //10 secs
      interval: 10000,
      //10 meter
      distanceFilter: 10,
    );


    //start listening to live location
    location.onLocationChanged.listen((LocationData mCurrentLocation) {
      //
      print("Location changes");
      currentLocation = mCurrentLocation;
      //only send location if driver is online
      if (_isOnline.value) {
        //push location to firebase
        deliveryBoyLocationRef.set({
          "id": currentUser.id,
          "latitude": currentLocation.latitude,
          "longitude": currentLocation.longitude,
        });
      }
    });
  }
}
