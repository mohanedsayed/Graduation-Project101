import 'package:flutter/material.dart';
import 'package:graduation_project101/constants/colors.dart';
import 'package:graduation_project101/views/home_page.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<SignUp> {
  String _firstname;
  String _lastname;
  String _email;
  String _confirmpassword;
  String _password;
  bool passvisible = true;
  bool passvisible2 = true;
  final TextEditingController _pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'First Name',
        //prefixIcon: Icon(Icons.person_rounded),
      ),
      //maxLength: 12,
      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _firstname = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      //maxLength: 12,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        _lastname = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
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
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _pass,
      decoration: InputDecoration(
        labelText: ' Password',
        suffixIcon: IconButton(
          icon: Icon(passvisible ? Icons.visibility : Icons.visibility_off),
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
    );
  }

  Widget _buildconfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: ' Confirm Password',
        suffixIcon: IconButton(
          icon: Icon(passvisible2 ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              passvisible2 = !passvisible2;
            });
          },
        ),
      ),
      obscureText: passvisible2,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        } else if (value != _pass) {
          return 'Password does not match';
        }

        return null;
      },
      onSaved: (String value) {
        _confirmpassword = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: primaryColor,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context, 'HomeScreen');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        //backgroundColor: Colors.grey[500].withOpacity(0.6),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: new Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        _buildFirstName(),
                        _buildLastName(),
                        _buildEmail(),
                        _buildPassword(),
                        _buildconfirmPassword(),
                        SizedBox(height: 40),

                        // _formKey.currentState.save();
                        //
                        // print(_name);
                        // print(_email);
                        // print(_phoneNumber);
                        // print(_url);
                        // print(_password);
                        // print(_calories);

                        //Send to API
                        //  },
                        //  ),
                      ],
                    ),
                  ),
                  Container(
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor,
                    ),
                    child: TextButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        //style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));

                        //TODO send to APi // if (!_formKey.currentState.validate()) {
                        //   return;
                        // }
                        // ;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
