import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:shohaara/constants.dart';
import 'package:shohaara/hiveModels/userModel.dart';
import 'fetcher.dart';

class ApiService {
  // static const String baseUrl =
  //     "https://shohaara-9k0p3s0kq-bashir-danish.vercel.app/api/v1";

  // static const String baseUrl = "http://192.168.1.250:5000/api/v1";

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
    Fetch fetch = Fetch('$kBaseUrl/users');
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
        profilePicture: '' as String,
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

    Fetch fetch = Fetch('$kBaseUrl/users/login');

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

// static Future<void> uploadImage({
//   required String? id,
//   required String authToken,
//   required Uint8List imageFile,
//   required String fileType,
//   required Function(String) onSuccess,
//   required Function(String) onError,
// }) async {
//   final String apiUrl = '$kBaseUrl/$id/upload';

//   final request = http.MultipartRequest('PUT', Uri.parse(apiUrl));
//   request.headers['Authorization'] = 'Bearer $authToken';

//   request.files.add(
//     http.MultipartFile(
//       'file',
//       http.ByteStream.fromBytes(imageFile),
//       imageFile.length,
//       filename: 'image.jpg',
//     ),
//   );

//   request.fields['fileType'] = fileType;
//   print(apiUrl);

//   try {
//     final response = await request.send();
//      final responseJson = await response.stream.bytesToString();
//       print(responseJson);
//     // Check the HTTP status code
//     if (response.statusCode == 200) {
//       // Decode the response JSON
//       final responseJson = await response.stream.bytesToString();
//       print(responseJson);

//       if (fileType == 'user') {
//         final userData = json.decode(responseJson);
//         final userBox = Hive.isBoxOpen('users')
//             ? Hive.box<User>('users')
//             : await Hive.openBox<User>('users');
//         await userBox.clear();
//         final user = User(
//           firstName: userData['firstName'] as String,
//           lastName: userData['lastName'] as String,
//           phoneNumber: userData['phoneNumber'].toString(),
//           email: userData['email'] as String,
//           username: userData['username'] as String,
//           profilePicture: userData['profilePicture'] as String,
//           token: authToken,
//           id: userData['_id'] as String,
//         );
//         await userBox.put('user', user);

//         print(user.username);
//         print(user.token);
//         print(user.profilePicture);

//         onSuccess(userData);
//       } else if (fileType == 'post') {
//         final imagePath = json.decode(responseJson)['imagePath'];
//         onSuccess(imagePath);
//       } else {
//         onError('Invalid fileType');
//       }
//     } else {
//       // Handle HTTP error
//       onError('Image upload failed. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     // Handle network or other errors
//     onError('Error uploading image: $e');
//   }
// }

  static Future<void> uploadImage({
    required String? id,
    required String authToken,
    required Uint8List imageFile,
    required String fileType,
    required Function(String) onSuccess,
    required Function(String) onError,
    User? userData,
  }) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final Reference storageRef = storage.ref();

      final String imagePath = '$fileType/$id/${DateTime.now()}.jpg';
      print("Uploading image to path: $imagePath");

      final UploadTask uploadTask =
          storageRef.child(imagePath).putData(imageFile);

      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

      final String downloadURL = await snapshot.ref.getDownloadURL();

      if (downloadURL.isNotEmpty) {
        final user = User(
          firstName: userData!.firstName,
          lastName: userData.lastName,
          phoneNumber: userData.phoneNumber,
          email: userData.email,
          username: userData.username,
          profilePicture: downloadURL,
          token: userData.token,
          id: userData.id,
        );
        print(user.profilePicture);
        final userBox = await Hive.openBox<User>('users');
        await userBox.clear();
        await userBox.put('user', user);
        Fetch fetch = Fetch('$kBaseUrl/users/$id/upload');
        await fetch.putData({imagePath: imagePath}, token: authToken);
      }
      if (fileType == 'user') {
        // Send the downloadURL to your Express server
        // final response = await http.post(
        //   , // Replace with your Express server API URL
        //   body: {'downloadURL': downloadURL},
        // );

        // if (response.statusCode == 200) {
        //   // Handle success
        //   onSuccess(downloadURL);
        // } else {
        //   // Handle HTTP error
        //   onError('Error uploading image to server: ${response.statusCode}');
        // }
      } else if (fileType == 'post') {
        // Handle post image upload if needed
        onSuccess(downloadURL);
      } else {
        onError('Invalid fileType');
      }
    } catch (e) {
      print("Error uploading image: $e");
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

    Fetch fetch = Fetch('$kBaseUrl/posts');

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
    final String apiUrl = '$kBaseUrl/users/$userId';

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
