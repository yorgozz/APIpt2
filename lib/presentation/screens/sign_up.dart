// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/shared_widgets/CustomTextField.dart';
import 'package:task6/provider/current_user_provider.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
        builder: (context, currentUserProvider, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Color(0xFFF9F9F9),
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 70),
                    CustomTextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Email',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.text,
                      labelText: 'First Name',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.text,
                      labelText: 'Last Name',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Password should contain at least 1 uppercase and a total of 8 characters',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF607385),
                        fontFamily: 'MontserratRegular',
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        currentUserProvider.handleSignUp(
                            context,
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            _firstNameController.text.trim(),
                            _lastNameController.text.trim());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontFamily: 'MontserratMedium'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (currentUserProvider.isLoading)
              Container(
                color: Color.fromARGB(42, 215, 209, 209),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      );
    });
  }
}
