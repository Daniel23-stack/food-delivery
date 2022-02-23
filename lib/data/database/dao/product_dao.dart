import 'package:floor/floor.dart';
import 'package:foodie_delivery_boy/data/database/dao/abstract_dao.dart';
import 'package:foodie_delivery_boy/data/models/product.dart';

@dao
abstract class ProductDao extends AbstractDao<Product> {
  @Query('SELECT * FROM products')
  Future<List<Product>> findAllFoods();

  @Query('SELECT * FROM products')
  Stream<List<Product>> findAllProductsAsStream();

  @Query('DELETE FROM products')
  Future<void> deleteAll();

  @Query('SELECT * FROM products WHERE vendorId != :vendorId')
  Future<List<Product>> findAllByVendorWhereNot(int vendorId);

  @Query('DELETE FROM products WHERE vendorId != :vendorId')
  Future<void> deleteAllByVendorWhereNot(int vendorId);
}
