import 'package:flutter/material.dart';
import 'userdata.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
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

// MediaQuery
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 1000,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.blue],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
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
                      margin: EdgeInsets.only(top: 40),
                      child: TextField(
                        onChanged: (value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Username',
                          label: Text('Enter your username'),
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
                            hintText: 'Password',
                            label: Text('Enter your password'),
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
                    SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(

                    // )
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 130, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
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
                                        builder: (context) => LoginSuccess()));
                              }
                            }
                          }
                          setState(() {});
                        },
                        child: Text('Log In',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      })),
    );
  }
}
