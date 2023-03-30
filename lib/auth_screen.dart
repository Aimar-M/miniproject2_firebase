import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  String? errorMessage = '';
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      setState(() {
        _loading = true;
      });

      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pushNamed(context, '/home');
      errorMessage = '';
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = 'Invalid Credentials';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> createUser() async {
    try {
      setState(() {
        _loading = true;
      });
      await Auth().createUser(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      setState(() {
        _isLogin = true;
      });
      Fluttertoast.showToast(
          msg: 'Registration successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  void handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (_isLogin) {
      await signInWithEmailAndPassword();
      return;
    }

    await createUser();
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: title,
            focusColor: Colors.black,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2))),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $title';
          }
          return null;
        },
        obscureText: title.toLowerCase().trim() == 'password');
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        errorMessage ?? '',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => handleSubmit(),
          child: _loading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ))
              : Text(_isLogin ? 'Login' : 'Register'),
        ),
      ],
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
            _resetForm();
            _formKey.currentState?.reset();
            errorMessage = '';
          });
        },
        child: Text(_isLogin ? 'Register Instead' : 'Login Instead',
            style: const TextStyle(fontSize: 12)));
  }

  void _resetForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneNumberController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Welcome to Rush Grocery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                          if (!_isLogin)
                            _entryField(
                              'first name',
                              _firstNameController,
                            ),
                          if (!_isLogin)
                            _entryField(
                              'last name',
                              _lastNameController,
                            ),
                          if (!_isLogin)
                            _entryField(
                              'phone number',
                              _phoneNumberController,
                            ),
                          _entryField(
                            'email',
                            _emailController,
                          ),
                          _entryField(
                            'password',
                            _passwordController,
                          ),
                          _errorMessage(),
                          _submitButton(),
                          _loginOrRegisterButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
