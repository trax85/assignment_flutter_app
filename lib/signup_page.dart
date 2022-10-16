import 'package:assignmentApp/userclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'userlist.dart';
import 'validate.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  String _passWord = '';
  String _userName = '';
  String _email = '';

  final _formKey = GlobalKey<FormState>();
  final userStoreController = Get.find<UserList>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup",
          style: TextStyle(
          color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.only(left:40, right:40),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                const Text("Enter Details", style: TextStyle(fontSize: 30, color: Colors.black),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter User Name",
                  ),
                  validator: (value){
                    String? str = Validate.validateName(value);
                    if(str == null){
                      _userName = value!;
                    }
                    return str;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Password",
                  ),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  validator: (value){
                    String? str = Validate.validatePassword(value);
                    if(str == null){
                      _passWord = value!;
                    }
                    return str;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Confirm Password",
                  ),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  validator: (value){
                    if(value != _passWord) {
                      return "password doesn't match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            UserMap userMap = UserMap(_userName,
                                _passWord, _email);
                            userStoreController.userList.add(userMap);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("submit")
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

}