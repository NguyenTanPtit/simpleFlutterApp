import 'package:rest_client/apis/login/login_api.dart';
import 'package:rest_client/models/login/login_request.dart';
import 'package:rest_client/models/login/user.dart';

abstract class LoginRepository{

  Future<User?> login(LoginRequest request);


}

class LoginRepositoryImpl extends LoginRepository{
  final LoginApi _loginApi;

  LoginRepositoryImpl(this._loginApi);
  @override
  Future<User> login(LoginRequest request) {
      return _loginApi.login(request);
  }

}