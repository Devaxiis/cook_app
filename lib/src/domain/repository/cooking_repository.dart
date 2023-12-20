import 'dart:convert';

import 'package:retsept/src/data/loacal_db_source.dart';
import 'package:retsept/src/domain/model/cooking_model.dart';


abstract class CookingRepository{
  Future<bool> storeCooking(CookingModel cooking);
  List<CookingModel> readCooking();
  Future<bool> deleteCooking(CookingModel cooking);
  Future<bool> clearCache();
}


class CookingRepositoryImpl implements CookingRepository{

  final LocalDataSource dataSource;

  const CookingRepositoryImpl({required this.dataSource});


  @override
  Future<bool> clearCache() {
    return dataSource.remove(StorageKey.cooked);
  }

  @override
  Future<bool> deleteCooking(CookingModel cooking) async{
    /// Object => json => String
    final list = readCooking();
    list.remove(cooking);
    final json = list.map((cook) => cook.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.cooked, data);
  }

  @override
  List<CookingModel> readCooking() {
    /// String => json => Object
    List<CookingModel> repo =[];
    String data = dataSource.read(StorageKey.cooked) ?? "[]";
    final json = jsonDecode(data) as List;
    repo = json.map((item) => CookingModel.fromJson(item as Map<String, Object?>)).toList();
    print("Data Bor:========================== $repo ==============================");
    return repo;
  }

  @override
  Future<bool> storeCooking(CookingModel cooking) async{
    /// Object => json => String
    final list = readCooking();
    list.add(cooking);
    final json = list.map((cook) => cook.toJson()).toList();
    final data = jsonEncode(json);
    return await dataSource.store(StorageKey.cooked, data);
  }

}