class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() => 'AppException($message, code: $statusCode)';
}

class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

class CacheException extends AppException {
  CacheException(String message) : super(message);
}
