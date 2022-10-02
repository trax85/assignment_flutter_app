// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:assignmentapp/validation.dart';

import 'package:assignmentapp/main.dart';

void main() {
  test('check for username', (){
    String uname = "hello@world.com";
    String? res = validateUserName(uname);
    expect(res, null);
  });

  test('check for password', (){
    String pword = "Hello123";
    String? res = validatePassword(pword);
    expect(res, "Wrong password");
  });
}
