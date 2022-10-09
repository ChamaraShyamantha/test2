import 'package:flutter/material.dart';
import 'package:MedicShare/assets/global_variables.dart';

import '../../../common/widgets/customButton.dart';



class VenderAuthenticationScreen extends StatefulWidget {
  static const String routeName = '/authentication-screen';
  const VenderAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<VenderAuthenticationScreen> createState() =>
      _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<VenderAuthenticationScreen> {
  final _VenderSignUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();

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
                    'Vender Sign Up',
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w900),
                  ),
                ),
              Form(
                key: _VenderSignUpFormKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Store Name',
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
                          controller: _ownerController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Owner Name',
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

                       const SizedBox(height: 10, ),
                       
                       CustomButton(
                        
                       text: 'Sign Up',
                        onTap: () {
                        if (_VenderSignUpFormKey.currentState!.validate()) {
                           signUpUser();
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

  void signUpUser() {}
}
