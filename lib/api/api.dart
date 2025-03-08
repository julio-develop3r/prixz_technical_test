import 'package:app/models/api_response.dart';
import 'package:dio/dio.dart';

import 'api_exception.dart';
import 'api_response_error.dart';

class Api {
  factory Api() => _singleton;

  Api._internal() {
    _initDio();
  }

  static final Api _singleton = Api._internal();

  late Dio _dio;

  Dio get dio => _dio;

  /// Inicializacion de [Dio] con al base url segun tipo de app
  Future<void> _initDio() async {
    // or new Dio with a BaseOptions instance.
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://openlibrary.org/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      // headers: <String, String>{
      //   'Content-Type': 'application/x-www-form-urlencoded',
      // },
    );

    _dio = Dio(options);
  }

  Future<ApiResponse> action(String action, {Map<String, Object?>? data}) async {
    Response<dynamic> res;

    try {
      res = await _dio.get(action);

      return ApiResponse.fromJson(res.data);
    } catch (e, stacktrace) {
      late String message;

      if (e is ApiResponseError) {
        message = e.message;
        print('💥 $action ${e.requestOptions.data} \n>> [${e.type}] msj: $message');
      } else {
        message = e.toString();
        print('💥 $action $message');
      }

      print('>> Trace: ${stacktrace.toString()}');
      throw ApiException(message);
    }
  }
}
