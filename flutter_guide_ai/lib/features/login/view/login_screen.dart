
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guide_ai/features/login/bloc/login_bloc.dart';

import '../bloc/login_state.dart';

class LoginScreen extends StatelessWidget{

  const LoginScreen ({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    return Scaffold(
        body: BlocBuilder<LoginBloc,LoginState>(builder: (context, state){
          if(state is LoginSuccessState){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png"),
                  const SizedBox(height: 20,),
                  const Text("Login Success"),
                  const SizedBox(height: 20,),
                  Text(state.user.username),
                ],
              ),
            );
          }else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 20,),
                const Text("Login"),
                const SizedBox(height: 20,),

                const Text("Username"),
                TextField(
                  controller: _username,
                  decoration:  const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),

                  ),
                )

              ],
            );
          }
        }),
    );
  }}