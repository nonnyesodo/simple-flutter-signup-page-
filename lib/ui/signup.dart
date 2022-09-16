import 'package:flutter/material.dart';
import 'package:signup/util/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();

  late String name;
  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
            flex: 2,
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
                      const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 12.0, top: 10.0),
                      child: Text(
                        'start your career with us',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //name textfield
                    Textfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid name!';
                        }
                        return null;
                      },
                      onchange: (value) => name = value,
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintext: 'Enter Your Name',
                      labeltext: 'NAME',
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //email text field
                    Textfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid email!';
                        }
                        return null;
                      },
                      onchange: (value) => email = value,
                      icon: const Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      hintext: 'Enter Email',
                      labeltext: 'Email',
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //password textfield
                    Textfield(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter a valid password!';
                        }
                        return null;
                      },
                      onchange: (value) => password = value,
                      obscure: true,
                      suficon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintext: 'Password',
                      labeltext: 'Password',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    //signup  button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.orange),
                      onPressed: () {
                        _submit();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black45),
                          ),
                          const SizedBox(
                            width: 25.0,
                          ),
                          //login button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white12),
                            onPressed: () {
                              setState(() {
                                Navigator.pushNamed(context, '/login');
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'login',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      (e);
    }
    setState(() {
      Navigator.pushNamed(context, '/welcome');
    });
  }
}
/*

                        */