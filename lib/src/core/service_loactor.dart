
import 'package:retsept/src/data/loacal_db_source.dart';

import '../domain/repository/cooking_repository.dart';

late final CookingRepository repository;

Future<void> serviceLocator() async{

  /// third party api => storage
  final db = await LocalDataSourceImpl.init;

  ///data
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);

  ///repository
  repository= CookingRepositoryImpl(dataSource: dataSource);
}