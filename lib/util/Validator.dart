class Validator {
  static Function acctNumValidator = (value) {
    if (value.isEmpty) {
      return "Account number field cannot be empty";
    } else if (value.length < 10) {
      return "the Account number has to be at least 10 characters long";
    } else
      return null;
  };

  static Function isEmptyValidator = (value) {
    if (value.isEmpty) {
      return "This field cannot be empty";
    } else
      return null;
  };

  static Function emailValidator = (value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return "Email field cannot be empty";
    } else if (!regex.hasMatch(value))
      return 'Please make sure your email address is valid';
    else
      return null;
  };

  static Function passwordValidator = (value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return "The password field cannot be empty";
    } else  {
      if (!regex.hasMatch(value))
        return 'Password should contain a lower case, upper case and a digit';
      else
        return null;
    }
  };

  static Function numberValidator = (String value) {
    if (value.isEmpty) {
      return "This field cannot be empty";
    }
    final n = num.tryParse(value);
    if(n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  };
}
