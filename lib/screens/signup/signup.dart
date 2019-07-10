import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';
import 'package:flutter_onboarding_with_scopedmodel/helper/input_validators.dart';

class Signup extends StatefulWidget {
  SignupState createState() => SignupState();
}

class SignupState extends State<StatefulWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _password;

  final _formHintStyle = const TextStyle(
    fontSize: 16, 
    color: Colors.blueGrey, 
    fontWeight: FontWeight.bold,
  );
  final _formInputTextStyle = const TextStyle(
    fontSize: 18, 
    color: Colors.black87, 
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return _buildSignupPage();
  }

  Widget _buildSignupPage() {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.black),
          onPressed:() => Navigator.pop(context, false),
        ),
      ),
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
              minimum: EdgeInsets.only(top: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    child: _buildFormUI(),
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

  Widget _buildFormUI() {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(Strings.signupTitle1, style: Theme.of(context).textTheme.display2),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(Strings.signupTitle2, style: Theme.of(context).textTheme.display2),
          ),
          Container(
            height: 480.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left:30, right: 30),
            child: Column(
              children: <Widget>[
                _buildEmailField(),
                const SizedBox(height: 10.0),
                _buildPasswordField(),
                const SizedBox(height: 10.0),
                _buildConfirmPasswordField(),
                const SizedBox(height: 35.0),
                _buildSignupButton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _validateInputs() {
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

  Widget _buildEmailField() {
    return TextFormField(
      validator: InputValidators.validateEmail,
      keyboardType: TextInputType.text,
      onSaved: (value) => _email = value,
      style: _formInputTextStyle,
      decoration: InputDecoration(
        labelText: Strings.emailFieldLabel,
        labelStyle: _formHintStyle,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1.0
            ) 
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width: 2.0,
          ) 
        )
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      validator: InputValidators.validatePassword,
      keyboardType: TextInputType.text,
      onSaved: (value) => _password = value,
      style: _formInputTextStyle,
      decoration: InputDecoration(
        labelText: Strings.passwordFieldLabel,
        labelStyle: _formHintStyle,
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
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      validator: _validateConfirmPassword,
      keyboardType: TextInputType.text,
      style: _formInputTextStyle,
      decoration: InputDecoration(
        labelText: Strings.confirmPasswordFieldLabel,
        labelStyle: _formHintStyle,
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
    );
  }

  Widget _buildSignupButton() {
    return Container(
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
            child: Text(Strings.signupButtonText, style: Theme.of(context).textTheme.button),
          ),
        ),
      ),
    );
  }

  String _validateConfirmPassword(String value) {
  if (value != _passwordController.text){
    return Strings.invalidConfirmPasswordText;
  } 
  return null;
  }

} 