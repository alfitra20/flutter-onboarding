import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool loggedIn = false;
  String _email;
  String _password;
  
  final _formHintTextStyle = const TextStyle(
    fontSize: 16, 
    color: Colors.blueGrey, 
    fontWeight: FontWeight.bold,
  );
  final _formInputTextStyle = const TextStyle(
    fontSize: 18, 
    color: Colors.black87, 
    fontWeight: FontWeight.bold,
  );
  final _forgotPasswordTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.lightBlueAccent,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
  final _signupQuestionTextStyle = const TextStyle(
    color: Colors.blueGrey,
    fontSize: 14, 
  );

  final _signupButtonTextStyle = const TextStyle(
    fontSize: 14,
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: PageScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: (viewportConstraints.maxHeight),
            ),
            child: SafeArea(
              minimum: EdgeInsets.only(top: 70.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // Build the Title Text
                        Container(
                          height: 60,
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(Strings.loginTitle1, style: Theme.of(context).textTheme.display2),
                        ),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(Strings.loginTitle2, style: Theme.of(context).textTheme.display2),
                        ),

                        // Build the Form and Login Button
                        Container(
                          height: 500.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(30),
                          child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    validator: _validateEmail,
                                    onSaved: (value) => _email = value,
                                    style: _formInputTextStyle,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: Strings.emailFieldLabel,
                                      labelStyle: _formHintTextStyle,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 1.0,
                                        ) 
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.lightBlueAccent,
                                          width: 2.0,
                                        ) 
                                      )
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  TextFormField(
                                    style: _formInputTextStyle,
                                    validator: _validatePassword,
                                    onSaved: (value) => _password = value,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: Strings.passwordFieldLabel,
                                      labelStyle: _formHintTextStyle,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blueGrey,
                                          width: 1.0,
                                        ) 
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.lightBlueAccent,
                                          width: 2.0,
                                        )
                                      )
                                    ),
                                    obscureText: true,
                                  ),
                                  const SizedBox(height: 15.0),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.only(top: 15.0, right: 9.0),
                                    child: InkWell(
                                      child: Text(Strings.forgotPasswordButtonText, style: _forgotPasswordTextStyle)
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Container(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(45),
                                      shadowColor: Colors.lightBlueAccent,
                                      color: Colors.blueAccent,
                                      elevation: 2,
                                      child: ButtonTheme(
                                        height: 45.0,
                                        minWidth: 450.0,
                                        child: FlatButton(
                                          onPressed: _validateInputs,
                                          child: Text(Strings.loginButtonText, style: Theme.of(context).textTheme.button),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                          Text(Strings.signupQuestion, style: _signupQuestionTextStyle),
                                          InkWell(
                                            onTap: (){Navigator.of(context).pushNamed('/signup');},
                                            child: Text(Strings.signupButtonText, style: _signupButtonTextStyle)
                                          ),
                                      ]
                                    ),
                                ],
                              ),
                          ),
                          )
                        ],
                      ),
                    ),
                  ]
                ),
              )
            )
          ); 
        }
      )
    );
  }

  void _validateInputs(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // If the form is valid, redirect to home.
      Navigator.of(context).pushNamed('/home');
    } else {
      setState(() {
        //If the data is not valid, TextFormField autoValidate => true to help user
        _autoValidate = true;
      });
    }
  }
}

String _validateEmail(String value){
  Pattern emailPattern = Strings.emailPattern;  
  RegExp emailRegex = new RegExp(emailPattern);
  if (!emailRegex.hasMatch(value)) {
    return Strings.invalidEmailAddressText;
  }
  return null;
}

String _validatePassword(String value) {
  if (value.length >= 15){
    return Strings.invalidPasswordText;
  } else if (value.length < 6){
    return Strings.emptyPasswordText;
  }
  return null;
}


  