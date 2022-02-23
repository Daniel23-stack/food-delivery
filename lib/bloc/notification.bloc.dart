import 'package:foodie_delivery_boy/bloc/base.bloc.dart';
import 'package:foodie_delivery_boy/data/models/notification_model.dart';

class NotificationsBloc extends BaseBloc {
  //BehaviorSubject stream getters
  Stream<List<NotificationModel>> get notifications =>
      appDatabase.notificationDao.findAllAsStream();
}
