import 'package:floor/floor.dart';
import 'package:foodie_delivery_boy/data/database/dao/abstract_dao.dart';
import 'package:foodie_delivery_boy/data/models/currency.dart';

@dao
abstract class CurrencyDao extends AbstractDao<Currency> {
  @Query('SELECT * FROM currencies')
  Future<List<Currency>> findAllCurrencys();

  @Query('SELECT * FROM currencies')
  Stream<List<Currency>> findAllCurrenciesAsStream();

  @Query('DELETE FROM currencies')
  Future<void> deleteAll();
}
