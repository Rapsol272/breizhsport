import 'package:breizhsport/View/SignInPage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test validation emails', () {
    test('Test true', () {
      expect(SignInPage.validateEmail('toto@gmail.com'), true);
    });

    test('Test without prefix', () {
      expect(SignInPage.validateEmail('@gmail.com'), false);
    });

    test('Test without "at"', () {
      expect(SignInPage.validateEmail('totogmail.com'), false);
    });

    test('Test without dot', () {
      expect(SignInPage.validateEmail('toto@gmailcom'), false);
    });

    test('Test with empty string between "at" and dot', () {
      expect(SignInPage.validateEmail('toto@.com'), false);
    });

    test('Test with empty string after dot', () {
      expect(SignInPage.validateEmail('toto@gmail.'), false);
    });

    test('Test with long string after dot', () {
      expect(SignInPage.validateEmail('toto@gmail.helloworld'), false);
    });
  });
}
