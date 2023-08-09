import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task6/presentation/shared_widgets/CustomTextField.dart';
import 'package:task6/Navigation/navi.dart';
import '../../provider/current_user_provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
        builder: (context, currentUserProvider, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
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
                              fontFamily: 'MontserratRegular',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF323E48)),
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
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: 'MontserratRegular',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () async {
                                currentUserProvider.handleLogin(
                                    context,
                                    _emailController.text.trim(),
                                    _passwordController.text.trim());
                              },
                              child: Text('Login'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (currentUserProvider.isLoading)
              Container(
                color: Color.fromARGB(138, 241, 238, 238),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: TextStyle(fontFamily: 'MontserratSemiBold')),
              SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Navi.toSignup(context);
                },
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 44, 37, 255),
                    fontFamily: 'MontserratSemiBold',
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
    });
  }
}
