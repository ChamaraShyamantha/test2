import 'package:flutter/material.dart';
import 'package:medic/assets/features/authentication/services/authentication_service.dart';
import 'package:medic/assets/global_variables.dart';

import '../../../common/widgets/customButton.dart';

class CustomerAuthenticationScreen extends StatefulWidget {
  static const String routeName = '/authentication-screen';
  const CustomerAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<CustomerAuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<CustomerAuthenticationScreen> {
  final _CustomerSignUpFormKey = GlobalKey<FormState>();
    final _CustomerSignInFormKey = GlobalKey<FormState>();
  final AuthenticationService authenticationService = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void userSignUp() {
    authenticationService.userSignUp(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      contactNo: _contactNoController.text,
      address: _addressController.text,
      

    );
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
          child: const Text('MEDICSHARE'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Image.asset('assets/images/logo.png'),
                  height: 100.0,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Customer Sign Up',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16.0,
                      letterSpacing: 1.0,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w900),
                ),
              ),
              Form(
                key: _CustomerSignUpFormKey,
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
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                              // fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ), 
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
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
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Your Name',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                              // fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
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
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _contactNoController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                            labelStyle: TextStyle(
                              fontSize: 13.0,
                              // fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (_CustomerSignUpFormKey.currentState!.validate()) {
                          userSignUp();
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 // void signUpUser() {}
}
