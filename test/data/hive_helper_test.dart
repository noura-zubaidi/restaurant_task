import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:resturant_task/data/hive_helper.dart';

import 'hive_helper_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late MockHiveInterface mockHive;
  late MockBox mockBox;
  late HiveHelper hiveHelper;

  setUp(() async {
    // Initialize Hive for tests
    await setUpTestHive();

    // Create mock objects
    mockHive = MockHiveInterface();
    mockBox = MockBox();
    hiveHelper = HiveHelper(mockHive);

    // Mock the openBox method
    when(mockHive.openBox('users')).thenAnswer((_) async => mockBox);
    when(mockHive.openBox('login')).thenAnswer((_) async => mockBox);
  });

  tearDown(() async {
    // Clean up Hive after tests
    await tearDownTestHive();
  });

  test('Open User Box', () async {
    final result = await hiveHelper.openUserBox();
    expect(result, isA<Box>());
  });

  test('Save and Retrieve User', () async {
    const phone = '12345';
    final userData = {'name': 'Test User', 'email': 'test@example.com'};

    when(mockBox.put(phone, userData)).thenAnswer((_) async {});
    when(mockBox.get(phone)).thenAnswer((_) async => userData);

    await hiveHelper.saveUser(phone, userData);
    final retrievedUser = await hiveHelper.getUserByPhone(phone);

    expect(retrievedUser, userData);
  });
}
