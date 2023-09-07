import 'dart:convert';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shohaara/hiveModels/userModel.dart';
import 'fetcher.dart';

class ApiService {
  // static const String baseUrl =
  //     "https://shohaara-3j71w6wbn-bashir-danish.vercel.app/api/v1";

  static const String baseUrl = "http://192.168.1.250:5000/api/v1";

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
        id: userResponse['_id'] as String,
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
        id: userResponse['_id'] as String,
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

  static Future<void> uploadImage({
    required String? id,
    required String authToken,
    required Uint8List imageFile,
    required String fileType,
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    final String apiUrl = '$baseUrl/$id/upload';

    final request = http.MultipartRequest('PUT', Uri.parse(apiUrl));
    request.headers['Authorization'] = 'Bearer $authToken';

    request.files.add(
      http.MultipartFile(
        'file',
        http.ByteStream.fromBytes(imageFile),
        imageFile.length,
        filename: 'image.jpg',
      ),
    );

    request.fields['fileType'] = fileType;

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseJson = await response.stream.bytesToString();

        if (fileType == 'user') {
          final userData = json.decode(responseJson);
          final userBox = Hive.isBoxOpen('users')
              ? Hive.box<User>('users')
              : await Hive.openBox<User>('users');
          await userBox.clear();
          final user = User(
            firstName: userData['firstName'] as String,
            lastName: userData['lastName'] as String,
            phoneNumber: userData['phoneNumber'].toString(),
            email: userData['email'] as String,
            username: userData['username'] as String,
            profilePicture: userData['profilePicture'] as String,
            token: authToken,
            id: userData['_id'] as String,
          );
          await userBox.put('user', user);

          print(user.username);
          print(user.token);
          print(user.profilePicture);
        
          onSuccess(userData);
        } else if (fileType == 'post') {
          final imagePath = json.decode(responseJson)['imagePath'];
          onSuccess(imagePath);
        } else {
          onError('Invalid fileType');
        }
      } else {
        onError('Image upload failed. Status code: ${response.statusCode}');
      }
    } catch (e) {
      onError('Error uploading image: $e');
    }
  }

  static Future<dynamic> getPosts({
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    final Box<User> userBox;
    if (Hive.isBoxOpen('users')) {
      userBox = Hive.box<User>('users');
    } else {
      userBox = await Hive.openBox<User>('users');
    }

    final user = userBox.get('user');

    Fetch fetch = Fetch('$baseUrl/posts');

    final responseBody = await fetch.getData(user?.token);
    final postSresponse = responseBody['posts'];

    if (responseBody['error'] == null) {
      whenComplete();
      return postSresponse;
    }

    // return responseBody;
  }

  static Future<Map<String, dynamic>> updateUser({
    required String userId,
    required String firstName,
    required String lastName,
    required String username,
    required String phoneNumber,
    required String email,
    required String authToken,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    final String apiUrl = '$baseUrl/users/$userId';

    final Map<String, dynamic> data = {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };

    final Map<String, dynamic> response =
        await Fetch(apiUrl).putData(data, token: authToken);

    if (response.containsKey('error')) {
      onError('Update failed: ${response['error']}');
      return {};
    }
    final userResponse = response['user'];
    final token = authToken;
    if (response['error'] == null) {
      final user = User(
        firstName: userResponse['firstName'] as String,
        lastName: userResponse['lastName'] as String,
        phoneNumber: userResponse['phoneNumber'].toString(),
        email: userResponse['email'] as String,
        username: userResponse['username'] as String,
        profilePicture: userResponse['profilePicture'] as String,
        token: token,
        id: userResponse['_id'] as String,
      );
      final Box<User> userBox;

      if (Hive.isBoxOpen('users')) {
        userBox = Hive.box<User>('users');
      } else {
        userBox = await Hive.openBox<User>('users');
      }
      await userBox.clear();
      await userBox.put('user', user);
    }

    whenComplete();
    return response;
  }
}
