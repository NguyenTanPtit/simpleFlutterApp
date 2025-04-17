import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_bloc.dart';
import 'package:flutter_guide_ai/features/login/view/login_screen.dart';
import 'package:flutter_guide_ai/repositories/login_repo/login_repo.dart';
import 'package:get_it/get_it.dart';

import 'core/theme/app_theme.dart';
import 'injector/injector.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRepository = GetIt.instance<LoginRepository>();
    return MaterialApp(
      title: 'Flutter Guide AI',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocProvider<LoginBloc>(create: (context)=> LoginBloc(loginRepository),
      child: const LoginScreen()),
    );
  }
}
