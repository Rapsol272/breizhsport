import 'package:breizhsport/View/SignInPage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Email validation : ', () {
    test('valid', () {
      expect(SignInPage.validateEmail('toto@gmail.com'), true);
    });

    test('without prefix', () {
      expect(SignInPage.validateEmail('@gmail.com'), false);
    });

    test('without "at"', () {
      expect(SignInPage.validateEmail('totogmail.com'), false);
    });

    test('without dot', () {
      expect(SignInPage.validateEmail('toto@gmailcom'), false);
    });

    test('with empty string between "at" and dot', () {
      expect(SignInPage.validateEmail('toto@.com'), false);
    });

    test('with empty string after dot', () {
      expect(SignInPage.validateEmail('toto@gmail.'), false);
    });

    test('with long string after dot', () {
      expect(SignInPage.validateEmail('toto@gmail.helloworld'), false);
    });
  });
}
