import 'package:assignmentApp/userclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homePage.dart';
import 'validate.dart';
import 'userlist.dart';

class Validation extends StatefulWidget{
  const Validation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ValidationState();
  }
}

class _ValidationState extends State<Validation> {
  final userStoreController = Get.put(UserList());
  final _userName = "buddy@gmail.com";
  var _passWord = "buddy123";
  final _formKey = GlobalKey<FormState>();

  void initalAdd(){
    UserMap userMap = UserMap("buddy@gmail.com", "buddy123", "buddy12@gmail.com");
    userStoreController.userList.add(userMap);
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    initalAdd();

    return Scaffold(
      resizeToAvoidBottomInset : false,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Center(
            child: Text("Login Form",
              style: TextStyle(
                color: Colors.black,
              ),
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
                    if(value!.isEmpty &&
                        Validate.validateUserName(value, userStoreController)){
                      return null;
                    }return "Incorrect Username";
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
                    if(value!.isEmpty &&
                        Validate.validatePassWord(value, userStoreController)){
                      return null;
                    }return "Incorrect Password";
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
                  },
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => const HomePage()
                          )
                          );
                        }
                      },
                      child: const Text("submit")
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (context) => const HomePage()
                                )
                            );
                        },
                        child: const Text("Signup")
                    ),
                  ],
                )
              ],
            )
      ),
      ),
    );
  }
}