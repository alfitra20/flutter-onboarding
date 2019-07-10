import 'package:flutter_onboarding_with_scopedmodel/assets/strings/strings.dart';

class InputValidators {

  static String validateEmail(String value) {
  Pattern emailPattern = Strings.emailPattern;  
  RegExp emailRegex = new RegExp(emailPattern);
  if (!emailRegex.hasMatch(value)) {
    return Strings.invalidEmailAddressText;
  }
  return null;
}

static String validatePassword(String value) {
  if (value.length >= 15) {
    return Strings.invalidPasswordText;
  } else if (value.length < 6) {
    return Strings.emptyPasswordText;
  }
  return null;
}
}