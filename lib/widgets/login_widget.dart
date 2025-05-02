import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/viewmodels/login_viewmodel.dart';
import 'package:orix_food/widgets/pass_field.dart';
import 'package:orix_food/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  @override
  Widget build(BuildContext context) {
    var loginVM = context.watch<LoginViewModel>();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWidget(
                onSaved: (value) {
                  _enteredEmail = value ?? "";
                },
                hintText: 'Enter your email',
                icon: CupertinoIcons.person,
                labelText: 'Email',
              ),
              SizedBox(height: 20),
              PassFieldWidget(
                onSaved: (value) {
                  _enteredPassword = value ?? "";
                },
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap:
                        loginVM.isLoading
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                loginVM.loginUser(
                                  _enteredEmail,
                                  _enteredPassword,
                                  context,
                                );
                              }
                            },
                    child: Container(
                      height: 53,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child:
                            loginVM.isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  'Sign IN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
