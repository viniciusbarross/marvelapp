class ComicItemsException implements Exception {
  final String message;

  ComicItemsException(this.message);

  @override
  String toString() {
    return 'ComicItemsException: $message';
  }
}
