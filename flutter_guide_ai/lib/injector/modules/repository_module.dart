import 'package:flutter_guide_ai/repositories/login_repo/login_repo.dart';
import 'package:rest_client/apis/login/login_api.dart';

import '../injector.dart';

class RepositoryModule {
  static void init() {
    final injector = Injector.instance;

    injector.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(injector<LoginApi>()),
    );

  }
}
