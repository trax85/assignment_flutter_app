import 'package:testapp/userclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homePage.dart';
import 'signup_page.dart';
import 'validate.dart';
import 'userlist.dart';

class SigninPage extends StatefulWidget{
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SigninState();
  }
}

class _SigninState extends State<SigninPage> {
  //Use getx controller to get the UserList instance
  final userStoreController = Get.put(UserList());
  final _formKey = GlobalKey<FormState>();

  void initalAdd(){
    //Add one default user to list during startup
    //UserList adds mapped user map to list
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
          //This key is used for form validation
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
                const Text("Enter Details", style: TextStyle(fontSize: 30, color: Colors.black),),
                const SizedBox(height: 20,),
                TextFormField(
                  key: const Key('username'),
                  decoration: const InputDecoration(
                    labelText: "Enter User Name",
                  ),
                  validator: (value){
                    if(value!.isNotEmpty &&
                        Validate.validateUserName(value, userStoreController)){
                      return null;
                    }return "Incorrect Username";
                  },
                ),
                TextFormField(
                  key: const Key('password'),
                  decoration: const InputDecoration(
                    labelText: "Enter Password",
                  ),
                  obscureText: true,
                  autocorrect: false,
                  enableSuggestions: false,
                  validator: (value){
                    if(value!.isNotEmpty &&
                        Validate.validatePassWord(value, userStoreController)){
                      return null;
                    }return "Incorrect Password";
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
                      child: const Text("Signin"),
                      key: const Key('signin'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (context) => const SignUp()
                                )
                            );
                        },
                        child: const Text("Signup"),
                        key: const Key('signup')
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