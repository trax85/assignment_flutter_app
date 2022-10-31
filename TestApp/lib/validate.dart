class Validate {

  static String? validateName(String? name){
    if(name!.isEmpty) return "Incorrect Username";
    bool nameValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]"
    r"+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(name);
    if(nameValid){
      return null;
    }else{
      return "Incorrect Username";
    }
  }

  static String? validatePassword(String? pass){
    if(pass!.isEmpty) {
      return "password should contain uppercase, digit, special characters";
    }
    bool nameValid = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])"
    r"(?=.*?[!@#\$&*~]).{8,}$").hasMatch(pass);
    if(nameValid){
      return null;
    }else {
      return "password should contain uppercase, digit, special characters";
    }
  }

  static String? validateEmailId(String? email, final userStoreController){
    if(email!.isEmpty) return null;
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]"
    r"+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid){
      return null;
    }else{
      return "Incorrect emailID";
    }
  }

  static bool validateUserName(String username, final userStoreController){
    for(var name in userStoreController.userList){
      if(username == name.getUserName()) {
        return true;
      }
    }
    return false;
  }

  static bool validatePassWord(String password, final userStoreController){
    for(var pswd in userStoreController.userList){
      if(password == pswd.getPassword()) {
        return true;
      }
    }
    return false;
  }
}