import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shohaara/hiveModels/userModel.dart';
import 'fetcher.dart';

class ApiService {
  static const String baseUrl =
      "https://shohaara-m7wxe1ew9-bashir-danish.vercel.app/api/v1";

  static Future<void> signUp({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    Fetch fetch = Fetch('$baseUrl/users');
    final responseBody = await fetch.postData({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'username': username,
      'email': email,
      'password': password,
    });

    if (responseBody['error'] == null) {
      final userResponse = responseBody['user'];
      final token = responseBody['token'];

      final user = User(
        firstName: userResponse['firstName'] as String,
        lastName: userResponse['lastName'] as String,
        phoneNumber: userResponse['phoneNumber'].toString(),
        email: userResponse['email'] as String,
        username: userResponse['username'] as String,
        profilePicture: userResponse['profilePicture'] as String,
        token: token,
      );

      final userBox = await Hive.openBox<User>('users');

      await userBox.clear();

      await userBox.put('user', user);

      whenComplete();
    } else {
      onError('SignUp failed: ${responseBody['error']}');
    }
  }

  static Future<dynamic> login({
    required String email,
    required String password,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    final Box<User> userBox;

    Fetch fetch = Fetch('$baseUrl/users/login');

    final responseBody = await fetch.postData({
      'email': email,
      'password': password,
    });
    final userResponse = responseBody['user'];
    final token = responseBody['token'];
    if (responseBody['error'] == null) {
      final user = User(
        firstName: userResponse['firstName'] as String,
        lastName: userResponse['lastName'] as String,
        phoneNumber: userResponse['phoneNumber'].toString(),
        email: userResponse['email'] as String,
        username: userResponse['username'] as String,
        profilePicture: userResponse['profilePicture'] as String,
        token: token,
      );

      if (Hive.isBoxOpen('users')) {
        userBox = Hive.box<User>('users');
      } else {
        userBox = await Hive.openBox<User>('users');
      }
      await userBox.clear();
      await userBox.put('user', user);
      whenComplete();
    }

    return responseBody;
  }
}
