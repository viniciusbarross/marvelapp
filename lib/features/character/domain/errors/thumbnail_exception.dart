class ThumbnailException implements Exception {
  final String message;

  ThumbnailException(this.message);

  @override
  String toString() {
    return 'ThumbnailException: $message';
  }
}
