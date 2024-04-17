import 'package:dartz/dartz.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<String, List<Character>>> listCharacters();
}
