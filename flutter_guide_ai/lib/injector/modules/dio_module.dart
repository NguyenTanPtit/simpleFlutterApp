import 'package:dio/dio.dart';
import 'package:flutter_guide_ai/configs/app_config/app_config.dart';
import 'package:flutter_guide_ai/injector/injector.dart';

class DioModule {
  static const String dioInstanceName = 'dio';

  static void init() {
    final injector = Injector.instance;
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: const Duration(seconds: AppConfig.connectTimeout),
      receiveTimeout: const Duration(seconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print(
          'Request: ${options.method} ${options.path} ${options.data} ${options.headers}',
        );
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token expiration
          print('Token expired');
        } else if (e.response?.statusCode == 403) {
          // Handle forbidden access
          print('Forbidden access');
        } else if (e.response?.statusCode == 500) {
          // Handle server error
          print('Server error');
        }
        return handler.next(e);
      },
    ));

    injector.registerSingleton<Dio>(dio, instanceName: dioInstanceName);
  }
}
