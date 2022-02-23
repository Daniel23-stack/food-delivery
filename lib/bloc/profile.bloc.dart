import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodie_delivery_boy/bloc/base.bloc.dart';
import 'package:foodie_delivery_boy/data/models/user.dart';
import 'package:foodie_delivery_boy/data/repositories/auth.repository.dart';
import 'package:foodie_delivery_boy/views/bottomsheets/earning.bottomsheet.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BaseBloc {
  //constructor
  ProfileBloc(this.context);

  //view context
  final BuildContext context;

  //AuthRepository
  AuthRepository _authRepository = AuthRepository();
  //view entered data
  BehaviorSubject<User> _user = BehaviorSubject<User>();

  //entered data variables getter
  Stream<User> get user => _user.stream;

  Future<void> logout() async {
    await _authRepository.logout();
  }

  //
  showEarrning() async {
    //
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EarningBottomSheet();
      },
    );
  }
}
