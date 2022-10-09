import 'package:flutter/material.dart';
import 'package:medic/assets/features/authentication/screens/customer_auth.dart';
import 'package:medic/assets/global_variables.dart';
import 'package:medic/assets/features/authentication/services/authentication_service.dart';
import '../../../common/widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

State<LoginScreen> createState() => _LoginScreenState();

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final AuthenticationService authenticationService = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void goToSignUp(){
    Navigator.pushReplacementNamed(context, CustomerAuthenticationScreen.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signInUser() {
    authenticationService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.appbacrcolor,
        title: Center(
          child: const Text('MEDISHARE'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Center(
              child: Container(
                child: Image.asset('assets/images/logo.png'),
                height: 130.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w900),
              ),
            ),
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          labelStyle: TextStyle(
                            fontSize: 13.0,
                            // fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 13.0,
                            // fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButton(
                      text: 'Login',
                      onTap: () {
                        if (_loginFormKey.currentState!.validate()) {
                          signInUser();
                        }
                      },
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 14.0,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          goToSignUp();
                        },
                        child: const Text(
                          'Do not have an account?',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 14.0,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      /*PopupMenuButton(
                          icon: Image.asset(
                            'assets/images/sign-up.png',
                            scale: 0.1,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text('Customer'),
                                ),
                                PopupMenuItem(
                                  child: Text('Vender'),
                                )
                              ]),*/
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
