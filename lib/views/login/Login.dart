import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/services/auth.dart';
import 'package:graduation_project101/services/login.dart';
import 'package:graduation_project101/views/home_page.dart';
import 'package:graduation_project101/views/signup/SignUp.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool check = false;
  String _email;
  String _password;
  bool passvisible = true;
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        print('$account');
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
    });
  }

  googleLogin() {
    googleSignIn.signIn();
  }

  final TextEditingController _pass = TextEditingController();

  final TextEditingController email = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _pass.dispose();
    email.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   // leading: Builder(
        //   //   builder: (BuildContext context) {
        //   //     return IconButton(
        //   //       color: primaryColor,
        //   //       icon: const Icon(Icons.arrow_back),
        //   //       onPressed: () {
        //   //         Navigator.pop(context, 'HomeScreen');
        //   //       },
        //   //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //   //     );
        //   //   },
        //   // ),
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  // image: new DecorationImage(
                  //   image: new AssetImage("images/bgcolor.png"),
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Email is Required';
                              }

                              if (!RegExp(
                                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email Address';
                              }

                              return null;
                            },
                            onSaved: (String value) {
                              _email = value;
                            },
                          ),
                          TextFormField(
                            controller: _pass,
                            decoration: InputDecoration(
                              labelText: ' Password',
                              suffixIcon: IconButton(
                                icon: Icon(passvisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passvisible = !passvisible;
                                  });
                                },
                              ),
                            ),
                            obscureText: passvisible,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password is Required';
                              }

                              return null;
                            },
                            onSaved: (String value) {
                              _password = value;
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Checkbox(
                                value: this.check,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.check = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(
                                color: Color(0xff1E57F3),
                              ),
                            ),
                          ],
                        ), //Checkbox

                        GestureDetector(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, 'ForgotPass');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: primaryColor,
                      ),
                      child: TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            User user = await Authentication.login(
                                email.text.trim(), _pass.text.trim());
                            if (user != null) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          }

                          // AuthClass().signIN(
                          //     email: email.text.trim(),
                          //     password: _pass.text.trim()).then((value) => );
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePage()),
                          //     (route) => false);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'Or',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => googleLogin(),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade200,
                            child: Text(
                              'G',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade200,
                          child: Text(
                            'F',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Dont' 't' ' have an account yet ? ')),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: GestureDetector(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: primaryColor),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
