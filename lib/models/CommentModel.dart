import 'package:flutter/material.dart';

String commentId = 'comment_id';
String commentText = 'comment_text';
String commentDate = 'comment_date';

class CommentModel {
  late final String _commentId;
  late final String _commentText;
  late final String _commentDate;

  CommentModel();

  CommentModel.init({
    required String commentId,
    required String commentText,
    required String commentDate,
  }) {
    _commentId = commentId;
    _commentText = _commentText;
    _commentDate = _commentDate;
  }

  CommentModel.fromMap(Map<dynamic, dynamic> json) {
    _commentId = json[commentId] ?? '';
    _commentText = json[commentText] ?? '';
    _commentDate = json[commentDate] ?? '';
  }

  Map<String, Object?> toMap() {
    return {
      commentId: getCommentId(),
      commentText: getCommentText(),
      commentDate: getCommentDate(),
    };
  }

  Map<String, Object?> toMapForUpdate() {
    return {
      commentText: getCommentText(),
      commentDate: getCommentDate(),
    };
  }

  String getCommentId() => _commentId;
  String getCommentText() => _commentText;
  String getCommentDate() => _commentDate;
}
