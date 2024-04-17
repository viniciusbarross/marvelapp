class CharacterException implements Exception {
  final String message;

  CharacterException(this.message);

  @override
  String toString() {
    return 'CharacterException: $message';
  }
}
