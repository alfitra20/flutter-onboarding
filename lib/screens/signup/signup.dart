import 'package:flutter/material.dart';
import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';

class Signup extends StatefulWidget {
  SignupState createState() => SignupState();
}

class SignupState extends State<StatefulWidget> {
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
  final _signupInfoTextStyle = const TextStyle(
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
    fontSize: 16, 
    color: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return _buildSignupPage();
  }

  Widget _buildSignupPage(){
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
                                _buildEmailFields(context),
                                const SizedBox(height: 10.0),
                                TextField(
                                  style: _formInputTextStyle,
                                  decoration: InputDecoration(
                                    labelText: Strings.passwordFieldLabel,
                                    labelStyle: _formHintStyle,
                                    // Add Error Border as well
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
                                const SizedBox(height: 10.0),
                                TextField(
                                  style: _formInputTextStyle,
                                  decoration: InputDecoration(
                                    labelText: Strings.confirmPasswordFieldLabel,
                                    labelStyle: _formHintStyle,
                                    // Add Error Border as well
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
                                const SizedBox(height: 35.0),
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
                                        onPressed: (){},
                                        child: Text(Strings.signupButtonText, style: Theme.of(context).textTheme.button),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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

  Widget _buildEmailFields(BuildContext context){
    return TextField(
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
}

  