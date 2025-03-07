class ApiException implements Exception {
  ApiException(this.message);

  String? message;

  @override
  String toString() {
    if (message == null) {
      return 'DataProviderException';
    }
    return message!;
  }
}
