import 'package:flutter/material.dart';
import 'package:signup/util/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Form(
                key: _formkey,
                child: ListView(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 15.0, right: 15.0),
                  children: [
                    const Text(
                      'Welcome Techie',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    const Text(
                      'Signin to continue',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //email field
                    Textfield(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enter a valid email';
                        }
                        return null;
                      },
                      onchange: (value) => email = value,
                      icon: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      hintext: 'Enter Email',
                      labeltext: 'EMAIL',
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //password field
                    Textfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter password';
                        }
                        return null;
                      },
                      onchange: (value) => password = value,
                      suficon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintext: 'Password',
                      labeltext: 'PASSWORD',
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    //login button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () {
                        _submit();
                      },
                      child: const Text('Log In'),
                    ),
                    //space
                    const SizedBox(
                      height: 10.0,
                    ),
                    //forget password text
                    const Center(
                      child: Text('Forget password?'),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //signup button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white60),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('processing data'),
        ),
      );
    }
    _formkey.currentState!.save();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      (e);
    }
    setState(() {
      Navigator.pushNamed(context, '/welcome');
    });
  }
}
