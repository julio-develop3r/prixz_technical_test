import 'package:dio/dio.dart';

class ApiResponseError extends DioException {
  ApiResponseError(this._error)
      : super(
          requestOptions: _error.requestOptions,
          response: _error.response,
          type: _error.type,
          error: _error.error,
        );

  final DioException _error;

  @override
  String get message {
    // Error from gograb Api
    final dynamic apiError = response?.data['error'];

    if (apiError != null) {
      return apiError;
    }

    return _error.message ?? _error.error.toString();
  }

  @override
  String toString() {
    String msg = message;

    if (error is Error) {
      msg += '\n${_error.stackTrace}';
    }

    return msg;
  }
}
