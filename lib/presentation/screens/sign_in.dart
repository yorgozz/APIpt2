import 'package:flutter/material.dart';
import 'package:task6/presentation/shared_widgets/CustomTextField.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF9F9F9),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('images/Group 10961.png'),
                  Text(
                    'You need to login to complete the booking process',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        labelText: 'Password',
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            // TODO: Implement the forgot password functionality
                            // You can use Navigator to navigate to the forgot password page.
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement sign-in logic using _emailController.text and _passwordController.text
                          // For example, you can use FirebaseAuth to sign in the user.
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            SizedBox(width: 5),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 44, 37, 255),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
