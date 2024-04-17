import 'package:dartz/dartz.dart';
import 'package:heroesapp/core/adapters/interfaces/http_adapter.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';
import 'package:heroesapp/features/character/infra/datasources/character_datasource.dart';

class CharacterDataSourceImpl implements CharacterDataSource {
  final HttpAdapter httpAdapter;

  CharacterDataSourceImpl(this.httpAdapter);

  @override
  Future<Either<String, List<Character>>> fetchCharactersFromApi() async {
    const String baseUrl = 'https://gateway.marvel.com/v1/public/characters';
    const String ts = '1';
    const String apiKey = 'eecb0a3e89fe28f7f22c4a0547048b62';
    const String hash = '7a3d0d3b3c6c40999ef58b96c90b5791';
    const String url = '$baseUrl?ts=$ts&apikey=$apiKey&hash=$hash';

    try {
      final response = await httpAdapter.get(url);

      final List<dynamic> results = response.data['data']['results'];

      final List<Character> characters = results.map((result) {
        return Character.fromJson(result);
      }).toList();

      return Right(characters);
    } catch (e) {
      return Left("Erro ao buscar personagens da API: $e");
    }
  }
}
