import 'package:flutter/material.dart';
import 'package:heroesapp/features/character/domain/entities/character.dart';
import 'package:heroesapp/features/character/domain/usecases/get_characteres.dart';

class CharacterController extends ChangeNotifier {
  final GetCharacters getCharacters;

  List<Character> _characters = [];
  List<Character> _filteredCharacters = [];
  String? _error;
  bool _isLoading = false;

  CharacterController({required this.getCharacters}) {
    _loadCharacters();
  }

  List<Character> get characters => _characters;
  List<Character> get filteredCharacters => _filteredCharacters;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> _loadCharacters() async {
    _isLoading = true;
    notifyListeners();

    final result = await getCharacters();

    result.fold(
      (errorMessage) {
        _error = errorMessage;
        _isLoading = false;
        notifyListeners();
      },
      (characters) {
        _characters = characters;
        _filteredCharacters = characters;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  void filterCharactersByName(String name) {
    _filteredCharacters = _characters.where((character) => character.name!.toLowerCase().contains(name.toLowerCase())).toList();
    notifyListeners();
  }
}
