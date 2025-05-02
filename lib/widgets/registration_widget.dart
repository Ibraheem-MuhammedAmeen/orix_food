import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/viewmodels/loading_provide.dart';
import 'package:orix_food/widgets/pass_field.dart';
import 'package:orix_food/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../viewmodels/register_viewmodel.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _confirmPass = '';
  var _userName = '';
  var _enteredMobile = '';

  @override
  Widget build(BuildContext context) {
    final registerVM = context.watch<RegisterViewModel>();

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFieldWidget(
                onSaved: (value) => _userName = value ?? '',
                hintText: 'Enter your username',
                icon: CupertinoIcons.person,
                labelText: 'User Name',
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                onSaved: (value) => _enteredEmail = value ?? '',
                hintText: 'Enter your email',
                icon: Icons.email_outlined,
                labelText: 'Email',
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                onSaved: (value) => _enteredMobile = value ?? '',
                hintText: 'Enter your mobile',
                icon: Icons.phone,
                labelText: 'Mobile',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              PassFieldWidget(
                onSaved: (value) => _enteredPassword = value ?? '',
                hintText: 'Enter your password',
                labelText: 'Password',
              ),
              SizedBox(height: 20),
              PassFieldWidget(
                onSaved: (value) => _confirmPass = value ?? '',
                hintText: 'Confirm your password',
                labelText: 'Confirm Password',
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap:
                        registerVM.isLoading
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                registerVM.registerUser(
                                  _enteredEmail,
                                  _enteredPassword,
                                  context,
                                  _confirmPass,
                                  _enteredMobile,
                                  _userName,
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
                            registerVM.isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                  'Continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
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
