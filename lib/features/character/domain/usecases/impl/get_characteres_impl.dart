import 'package:dartz/dartz.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';
import 'package:heroesapp/features/character/domain/repositories/character_repository.dart';
import 'package:heroesapp/features/character/domain/usecases/get_characteres.dart';

class GetCharactersImpl implements GetCharacters {
  final CharacterRepository repository;

  GetCharactersImpl(this.repository);

  @override
  Future<Either<String, List<Character>>> call() async {
    try {
      return await repository.listCharacters();
    } catch (e) {
      return Left("Erro ao obter personagens: $e");
    }
  }
}
