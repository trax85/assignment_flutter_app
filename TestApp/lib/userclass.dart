class UserMap {
  late String _userName;
  late String _password;
  late String _emailID;

  UserMap(String name, String password, String emailID){
    _userName = name;
    _password = password;
    _emailID = emailID;
  }

  //UserMap({required this._userName,
  //  required this._password, required this._emailID});

  getUserName(){
    return _userName;
  }
  getPassword(){
    return _password;
  }
  getEmailId(){
    return _emailID;
  }

  setUsername(String name){
    _userName = name;
  }

  setPassWord(String pswd){
    _password = pswd;
  }

  setEmailId(String email){
    _emailID = email;
  }
}