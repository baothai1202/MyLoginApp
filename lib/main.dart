import 'package:flutter/material.dart';

import 'package:flutter_application_1/studentBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'userdata.dart';
import 'ListStudent.dart';
import 'ShoppingPage.dart';

void main() {
  runApp(MaterialApp(
    home:
        BlocProvider(create: (context) => studentBloc(), child: Liststudent()),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHiddenPassword = true;
  String _username = '';
  String _password = '';
  String? _errorPassword;
  String? _errorUsername;
//late voi final voi const
// setstate hoat dong nhu nao
// MediaQuery
  @override
  Widget build(BuildContext context) {
    final double y = MediaQuery.of(context).size.height;
    final double x = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: y,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white],
              ),
            ),
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  top: y / 4,
                  child: Container(
                    width: x - 30,
                    height: y / 1.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.5)),
                        ]),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: y / 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 20),
                        child: TextField(
                          onChanged: (value) {
                            _username = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Username',
                            label: Text('Username'),
                            errorText: _errorUsername,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: EdgeInsets.only(top: 40),
                        child: TextField(
                          onChanged: (value) {
                            _password = value;
                          },
                          obscureText: _isHiddenPassword,
                          decoration: InputDecoration(
                              hintText: 'Enter your Password',
                              label: Text('Password'),
                              errorText: _errorPassword,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isHiddenPassword = !_isHiddenPassword;
                                    });
                                  },
                                  icon: Icon(Icons.remove_red_eye))),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(Icons.check_box_outline_blank),
                            Text("Remember me"),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Forgot password?",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      // GestureDetector(

                      // )
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 120, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            _errorUsername = 'Username is incorrect';
                            _errorPassword = 'Password is incorrect';
                            for (int i = 0; i < username.length; i++) {
                              if (_username == username[i]) {
                                _errorUsername = null;
                                if (_password == password[i]) {
                                  _errorPassword = null;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Shoppingpage()));
                                }
                              }
                            }
                            setState(() {});
                          },
                          child: Text('Log In',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white))),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Sign Up", style: TextStyle(color: Colors.blue))
                      ])
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
