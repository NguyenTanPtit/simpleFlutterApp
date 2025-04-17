import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_event.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_state.dart';
import 'package:rest_client/models/login/login_request.dart';
import 'package:rest_client/models/login/user.dart';

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
      final User? user = await _loginRepository.login(request);
      if (user == null) {
        emit(LoginErrorState("Login failed"));
        return;
      }
      emit(LoginSuccessState(user));
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
