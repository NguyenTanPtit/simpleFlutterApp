
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../models/login/login_request.dart';
import '../../models/login/user.dart';

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {

  factory LoginApi(Dio dio) = _LoginApi;

  @POST('auth/login')
  Future<User> login(@Body() LoginRequest request);
}