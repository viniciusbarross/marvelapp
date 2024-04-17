import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:heroesapp/core/adapters/implementation/http_dio.dart';
import 'package:heroesapp/core/adapters/interfaces/http_adapter.dart';
import 'package:heroesapp/features/character/domain/repositories/character_repository.dart';
import 'package:heroesapp/features/character/domain/usecases/get_characteres.dart';
import 'package:heroesapp/features/character/domain/usecases/impl/get_characteres_impl.dart';
import 'package:heroesapp/features/character/external/character_datasource_impl.dart';
import 'package:heroesapp/features/character/infra/datasources/character_datasource.dart';
import 'package:heroesapp/features/character/infra/repositories/character_repository_impl.dart';

class InjectConfig {
  static injectDependencies() {
    //Adapters
    HttpAdapter httpAdapter = HttpDio(Dio());

    //Datasources
    CharacterDataSource favoritesDataSource = CharacterDataSourceImpl(httpAdapter);

    //Repositories
    CharacterRepository favoritesRepository = CharacterRepositoryImpl(favoritesDataSource);

    //Usecases
    GetCharacters getCharacters = GetCharactersImpl(favoritesRepository);

    //Inject dependencies

    GetIt.I.registerSingleton<GetCharacters>(getCharacters);

    //Inject Adapters
    GetIt.I.registerSingleton<HttpAdapter>(httpAdapter);
  }
}
