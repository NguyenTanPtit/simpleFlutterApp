import 'package:flutter_guide_ai/injector/injector.dart';
import 'package:rest_client/apis/login/login_api.dart';

import 'dio_module.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;


    injector.registerFactory<LoginApi>(
          () => LoginApi(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );

  }
}
