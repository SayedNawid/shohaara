import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/models/comment_model.dart';
import 'package:shohaara/models/post_model.dart';

import 'package:shohaara/hiveModels/userModel.dart';
import 'package:shohaara/services/api_service.dart';
import 'fetcher.dart';

class PostService {
  static List<Map<String, dynamic>> posts = [];
  static List<CommentModel> comments = [];
  static User? userData;
  static bool isLoading = false;
  static Function(Map<String, dynamic> post) onPostCreated = (post) {};

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
      // print('Failed to fetch posts. Error: ${responseBody['error']}');
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

      final post = PostModel.fromJson(postResponse);
      // posts.add(post.toMap());
      PostService.onPostCreated(post.toMap());
      //  posts.insert(0, post.toMap());

      whenComplete();
    } else {
      onError('error failed: ${responseBody['error']}');
    }
  }

  static Future<void> likePost(String postId) async {
    final Map<String, dynamic> body = {
      'postId': postId,
      'userId': ApiService.loggedInUser?.id,
    };

    Fetch fetch = Fetch('$kBaseUrl/posts/like');

    final responseBody = await fetch.postData(body, token: userData?.token);
  }

static Future<List<CommentModel>> getCommentsForPost(
  String postId, {
  required Function(List<CommentModel>) onSuccess,
  required Function(String) onError,
}) async {
  String? userId = ApiService.loggedInUser!.id;
  final Fetch fetch = Fetch('$kBaseUrl/comments/$postId/$userId');

  final responseBody = await fetch.getData(ApiService.loggedInUser?.token);

  if (responseBody['error'] == null) {
    final commentResponse = responseBody['comments'];

    if (commentResponse is List<dynamic>) {
      
      List<CommentModel> comments = commentResponse
          .map((commentJson) => CommentModel.fromJson(commentJson))
          .toList();

      onSuccess(comments); 
      return comments; 
    } else {
      onError('Invalid response format: comments should be a list.');
    }
  } else {
    onError('Failed to fetch comments: ${responseBody['error']}');
  }


  return [];
}

static Future<void> addComment({
  required String postId,
  required String text,

  required Function(CommentModel) onSuccess,
  required Function(String) onError,
}) async {
  Fetch fetch = Fetch('$kBaseUrl/comments');

  final responseBody = await fetch.postData({
    'text': text,
    'postID':postId,
    'userID':ApiService.loggedInUser?.id
  }, token: ApiService.loggedInUser?.token);

  if (responseBody['error'] == null) {
    final commentResponse = responseBody['comment'];

    if (commentResponse != null) {
      final CommentModel comment = CommentModel.fromJson(commentResponse);
      onSuccess(comment);
    } else {
      onError('Invalid response format: comment should not be null.');
    }
  } else {
    onError('Failed to add comment: ${responseBody['error']}');
  }
}

}
