import 'package:floor/floor.dart';
import 'package:foodie_delivery_boy/data/database/dao/abstract_dao.dart';
import 'package:foodie_delivery_boy/data/models/user.dart';

@dao
abstract class UserDao extends AbstractDao<User> {
  @Query('SELECT * FROM users LIMIT 1')
  Future<User> findCurrent();

  @Query('SELECT * FROM users LIMIT 1')
  Stream<User> findCurrentAsStream();

  @Query('DELETE FROM users')
  Future<void> deleteAll();
}
