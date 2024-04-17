class ComicException implements Exception {
  final String message;

  ComicException(this.message);

  @override
  String toString() {
    return 'ComicException: $message';
  }
}
