class UrlException implements Exception {
  final String message;

  UrlException(this.message);

  @override
  String toString() {
    return 'UrlException: $message';
  }
}
