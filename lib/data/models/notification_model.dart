import 'package:floor/floor.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';

@Entity(tableName: 'notifications')
class NotificationModel {
  @primaryKey
  int id;
  String title;
  String body;
  int timeStamp;
  int read;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.timeStamp,
    this.read = 0,
  });

  @ignore
  String get formattedTimeStamp {
    final notificationDateTime =
        DateTime.fromMillisecondsSinceEpoch(this.timeStamp);
    final formmartedDate = DateFormat("EEE dd, MMM yyyy", I18n.localeStr).format(
      notificationDateTime,
    );
    return "$formmartedDate";
  }
}
