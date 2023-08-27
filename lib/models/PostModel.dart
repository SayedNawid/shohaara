import 'package:flutter/material.dart';

String postId = 'post_id';
String postImageURL = 'post_image_url';
String postText = 'post_text';
String postDate = 'post_date';
String postLike = 'post_like';

class PostModel {
  late final String _postId;
  late final String _postImageURL;
  late final String _postText;
  late final String _postDate;
  late final double _postLike;

  PostModel();

  PostModel.init(
      {required String postId,
      required String postImageURL,
      required String postText,
      required String postDate,
      required double postLike}) {
    _postId = postId;
    _postImageURL = postImageURL;
    _postText = postText;
    _postDate = postDate;
    _postLike = postLike;
  }

  PostModel.fromMap(Map<dynamic, dynamic> json) {
    _postId = json[postId] ?? '';
    _postImageURL = json[postImageURL] ?? '';
    _postText = json[postText] ?? '';
    _postDate = json[postDate] ?? '';
    _postLike = json[postLike];
  }

  Map<String, Object?> toMap() {
    return {
      postId: getPostId(),
      postImageURL: getPostImageURL(),
      postText: getPostText(),
      postDate: getPostDate(),
      postLike: getPostLike()
    };
  }

  Map<String, Object?> toMapForUpdate() {
    return {
      postImageURL: getPostImageURL(),
      postText: getPostText(),
      postDate: getPostDate(),
      postLike: getPostLike()
    };
  }

  String getPostId() => _postId;
  String getPostImageURL() => _postImageURL;
  String getPostText() => _postText;
  String getPostDate() => _postDate;
  double getPostLike() => _postLike;
}
