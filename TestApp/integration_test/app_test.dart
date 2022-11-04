import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:testapp/homePage.dart';
import 'package:mockito/mockito.dart';
import 'package:testapp/signin_page.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late NavigatorObserver mockObserver;

  setUp(() {
    mockObserver = MockNavigatorObserver();
  });

  group("end to end testing", () {
    testWidgets('tap on signin button',
            (tester) async {
      
      //Init widgets
      final username = find.byKey(const Key('username'));
      final password = find.byKey(const Key('password'));
      final Finder signin = find.byKey(const Key('signin'));

      //Launch the main function
      await tester.pumpWidget(GetMaterialApp(
        home: const SigninPage(),
        navigatorObservers: [mockObserver],));
      //Populate frames and wait
      await tester.pumpAndSettle();

      Future<void> _enterAndNavigate(WidgetTester tester)async {
        await tester.tap(username);
        await tester.enterText(username, "buddy@gmail.com");
        await tester.tap(password);
        await tester.enterText(password, "buddy123");
        await tester.tap(signin);
        //Make sure all animation is done before checking further
        await tester.pumpAndSettle();
      }

      await _enterAndNavigate(tester);
      //verify(mockObserver.didPush(any!, any));
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}