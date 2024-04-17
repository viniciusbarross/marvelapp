import 'package:dartz/dartz.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';
import 'package:heroesapp/features/character/domain/repositories/character_repository.dart';
import 'package:heroesapp/features/character/infra/datasources/character_datasource.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDataSource dataSource;

  CharacterRepositoryImpl(this.dataSource);

  @override
  Future<Either<String, List<Character>>> listCharacters() async {
    try {
      return await dataSource.fetchCharactersFromApi();
    } catch (e) {
      return Left("Erro ao listar personagens: $e");
    }
  }
}
