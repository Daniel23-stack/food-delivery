import 'package:floor/floor.dart';
import 'package:foodie_delivery_boy/data/database/dao/abstract_dao.dart';
import 'package:foodie_delivery_boy/data/models/product_extra.dart';

@dao
abstract class ProductExtraDao extends AbstractDao<ProductExtra> {
  @Query('SELECT * FROM product_extras')
  Future<List<ProductExtra>> findAll();

  @Query("DELETE FROM product_extras WHERE productId = :productId")
  Future<void> deleteAllByproductId(int productId);

  @Query('SELECT * FROM product_extras WHERE productId = :productId')
  Stream<List<ProductExtra>> findAllByproductIdAsStream(int productId);

  @Query('SELECT * FROM product_extras WHERE productId = :productId')
  Future<List<ProductExtra>> findAllByproductId(int productId);

  @Query('DELETE FROM product_extras')
  Future<void> deleteAll();
}
