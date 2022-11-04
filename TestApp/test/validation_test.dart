// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:testapp/validate.dart';
import 'package:get/get.dart';
import 'package:testapp/userlist.dart';
import 'package:testapp/userclass.dart';

void main() {
  String uname = "hello@world.com";
  String pword = "Hello@123";

  test('check for username', (){
    String? res = Validate.validateName(uname);
    expect(res, null);
  });

  test('check for password', (){
    String? res = Validate.validatePassword(pword);
    expect(res, null);
  });

  test('check for user addition', (){
    final userStoreController = Get.put(UserList());
    UserMap userMap = UserMap(uname, pword, "buddy12@gmail.com");
    userStoreController.userList.add(userMap);
    bool uval = Validate.validateUserName(uname, userStoreController);
    bool pval = Validate.validatePassWord(pword, userStoreController);
    expect(uval, true);
    expect(pval, true);
  });
}
