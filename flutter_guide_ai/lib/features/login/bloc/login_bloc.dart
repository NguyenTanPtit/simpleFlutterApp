import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_event.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_state.dart';
import 'package:rest_client/models/login/login_request.dart';
import 'package:rest_client/models/login/user.dart';

import 'dart:developer';

import '../../../repositories/login_repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitialState()) {
    on<LoginEvent>((event, emit) async {
      await _onLoginEvent(event, emit);
    });
  }


  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      final LoginRequest request =
      LoginRequest(event.username, event.password, 30);

      // Log the request
      log('Login API Request: ${request.toJson()}');

      final User? user = await _loginRepository.login(request);

      // Log the response
      if (user != null) {
        log('Login API Response: ${user.toJson()}');
        emit(LoginSuccessState(user));
      } else {
        log('Login API Response: null');
        emit(LoginErrorState("Login failed"));
      }
    } catch (e) {
      // Log the error
      log('Login API Error: $e');
      emit(LoginErrorState(e.toString()));
    }
  }
}
