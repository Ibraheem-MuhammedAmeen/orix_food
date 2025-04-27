import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orix_food/core/theme/app_colors.dart';
import 'package:orix_food/widgets/pass_field.dart';
import 'package:orix_food/widgets/text_field.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({super.key});

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var _enteredEmail = '';
    var _enteredPassword = '';
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 53,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
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
