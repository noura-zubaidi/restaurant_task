import 'package:hive/hive.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:resturant_task/data/hive_helper.dart';

class MockBox extends Mock implements Box {} // Mock the Hive Box class

void main() {
  group('HiveHelper Tests', () {
    late HiveHelper hiveHelper;
    late MockBox mockUserBox;
    late MockBox mockLoginBox;

    setUp(() {
      mockUserBox = MockBox();
      mockLoginBox = MockBox();
      hiveHelper = HiveHelper();

      when(hiveHelper.openUserBox()).thenAnswer((_) async => mockUserBox);
      when(hiveHelper.openLoginBox()).thenAnswer((_) async => mockLoginBox);
    });

    test('getUserByPhone - Should return user data when phone exists',
        () async {
      const testPhone = '1234567890';
      final testUserData = {
        'phone': testPhone,
        'email': 'test@example.com',
        'name': 'Test User'
      };
      when(mockUserBox.get(testPhone)).thenReturn(testUserData);

      final result = await hiveHelper.getUserByPhone(testPhone);

      expect(result, testUserData);
    });

    test('getUserByPhone - Should return null when phone does not exist',
        () async {
      const testPhone = '1234567890';
      when(mockUserBox.get(testPhone)).thenReturn(null);

      final result = await hiveHelper.getUserByPhone(testPhone);

      expect(result, isNull);
    });

    test('saveUser - Should save user data to Hive', () async {
      const testPhone = '1234567890';
      final testUserData = {
        'phone': testPhone,
        'email': 'test@example.com',
        'name': 'Test User'
      };
      when(mockUserBox.put(testPhone, testUserData)).thenAnswer((_) async {});

      await hiveHelper.saveUser(testPhone, testUserData);

      verify(mockUserBox.put(testPhone, testUserData)).called(1);
    });

    test('setRememberMe - Should save phone number to login box', () async {
      const testPhone = '1234567890';
      when(mockLoginBox.put('phone', testPhone)).thenAnswer((_) async {});

      await hiveHelper.setRememberMe(testPhone);

      verify(mockLoginBox.put('phone', testPhone)).called(1);
    });
  });
}
