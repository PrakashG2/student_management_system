import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_management_system/widgets/custom_text_field.dart';
import 'package:student_management_system/widgets/rounded_button.dart';
import 'package:student_management_system/widgets/show_password_button.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmj8SbIkf15HKJQ47D2pFPHf_47u3DGLRNhw&usqp=CAU'),
              ),
              CustomTextField(
                label: 'Username',
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username.';
                  }
                  return null;
                },
              ),
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
              ),
              CustomTextField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: !_isPasswordVisible,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please confirm your password.';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
              ),
              // ShowPasswordButton(
              //   isVisible: _isPasswordVisible,
              //   onPressed: () {
              //     setState(() {
              //       _isPasswordVisible = !_isPasswordVisible;
              //     });
              //   },
              // ),
              RoundedButton(
                label: 'Signup',
                onPressed: () => _handleSignup(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Already a user? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Handle successful signup (e.g., navigate to the home screen)
        // Replace "Home" with your desired destination after signup
        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        // Handle specific signup errors
        print('Error during signup: ${e.message}');
      } catch (e) {
        // Handle other unexpected errors
        print('Unexpected error during signup: $e');
      }
    }
  }
}
