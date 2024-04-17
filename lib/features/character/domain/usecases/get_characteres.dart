import 'package:dartz/dartz.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';

abstract class GetCharacters {
  Future<Either<String, List<Character>>> call();
}
