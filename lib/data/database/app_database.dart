import 'dart:async';
import 'package:floor/floor.dart';
import 'package:foodie_delivery_boy/data/database/dao/currency_dao.dart';
import 'package:foodie_delivery_boy/data/database/dao/product_dao.dart';
import 'package:foodie_delivery_boy/data/database/dao/product_extra_dao.dart';
import 'package:foodie_delivery_boy/data/database/dao/notification_dao.dart';
import 'package:foodie_delivery_boy/data/database/dao/user_dao.dart';
import 'package:foodie_delivery_boy/data/database/dao/vendor_dao.dart';
import 'package:foodie_delivery_boy/data/models/currency.dart';
import 'package:foodie_delivery_boy/data/models/notification_model.dart';
import 'package:foodie_delivery_boy/data/models/user.dart';
import 'package:foodie_delivery_boy/data/models/vendor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:foodie_delivery_boy/data/models/product.dart';
import 'package:foodie_delivery_boy/data/models/product_extra.dart';

part 'app_database.g.dart'; // the generated code will be there

@Database(
  version: 1,
  entities: [Product, ProductExtra, User, Currency, Vendor, NotificationModel],
)
abstract class AppDatabase extends FloorDatabase {
  // DAO getters
  ProductDao get productDao;
  ProductExtraDao get productExtraDao;
  UserDao get userDao;
  CurrencyDao get currencyDao;
  VendorDao get vendorDao;
  NotificationDao get notificationDao;
}
