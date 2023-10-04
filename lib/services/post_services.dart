import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/models/post_model.dart';
import 'package:shohaara/hiveModels/userModel.dart';
import 'fetcher.dart';

class PostService {
  static List<Map<String, dynamic>> posts = [];
  static User? userData;
  static bool isLoading = false;

  static Future<void> fetchPosts({
    required Function() whenComplete,
    required Function() onError,
  }) async {
    final Box<User> userBox;
    if (Hive.isBoxOpen('users')) {
      userBox = Hive.box<User>('users');
    } else {
      userBox = await Hive.openBox<User>('users');
    }

    final userData = userBox.get('user');

    Fetch fetch = Fetch('$kBaseUrl/posts');

    final responseBody = await fetch.getData(userData?.token);

    final postResponse = responseBody['posts'];

    if (responseBody['error'] == null) {
      posts = List<Map<String, dynamic>>.from(postResponse);
      if (posts.isNotEmpty) {
        print('Posts exist: $posts');
      }
    } else {
      print('Failed to fetch posts. Error: ${responseBody['error']}');
      onError();
    }

    whenComplete();
  }

  static Future<void> createPost({
    required String userId,
    required String text,
    required String imagePath,
    required String authToken,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    Fetch fetch = Fetch('$kBaseUrl/posts');
    // text, imagePath, userId
    final responseBody = await fetch.postData({
      'text': text,
      'imagePath': imagePath,
      'userId': userId,
    }, token: authToken);

    if (responseBody['error'] == null) {
      final postResponse = responseBody['post'];

      print(postResponse);
      // final newPost = PostModel.fromJson(postResponse);
      // Add the new post at the top of the posts list
      // posts.insert(0, newPost as Map<String, dynamic>);
      // final user = User(
      //   firstName: userResponse['firstName'] as String,
      //   lastName: userResponse['lastName'] as String,
      //   phoneNumber: userResponse['phoneNumber'].toString(),
      //   email: userResponse['email'] as String,
      //   username: userResponse['username'] as String,
      //   profilePicture: '' as String,
      //   token: token,
      //   id: userResponse['_id'] as String,
      // );

      // final userBox = await Hive.openBox<User>('users');

      // await userBox.clear();

      // await userBox.put('user', user);

      whenComplete();
    } else {
      onError('SignUp failed: ${responseBody['error']}');
    }
  }

  static Future<void> likePost(String postId) async {
    final userId = userData?.id;
    print("postId");
    print(postId);

    // final int postIndex = posts.indexWhere((post) => post['_id'] == postId);
    // print(postIndex);
    // if (postIndex != -1) {
    // final List<dynamic> postLikes = posts[postIndex]['likes'];

    // if (postLikes.contains(userId)) {
    //   postLikes.remove(userId);
    // } else {
    //   postLikes.add(userId);
    // }
    // print(userData);
    // print(postLikes);

    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer ${userData?.token}',
    // };

    final Map<String, dynamic> body = {
      'postId': postId,
      'userId': userId,
    };

    Fetch fetch = Fetch('$kBaseUrl/posts/like');

    final responseBody = await fetch.postData(body, token: userData?.token);
    // }
  }
}
