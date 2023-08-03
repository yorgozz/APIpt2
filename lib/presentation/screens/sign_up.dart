import 'package:flutter/material.dart';
import 'package:task6/presentation/shared_widgets/CustomTextField.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement sign-up logic using the input field values
                  // For example, you can use FirebaseAuth to sign up the user.
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
