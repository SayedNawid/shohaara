import 'package:flutter/material.dart';
import 'package:shohaara/packages/CommentModel.dart';

import 'firebase_realtime_database.dart';

Future<void> addCommentToFirebaseDatabase(
    {required CommentModel commentModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await databaseReference
        .child('Comments/${commentModel.getCommentId()}')
        .set(commentModel.toMap());
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}
Future<List<CommentModel>> getCommentsFromFirebaseDatabase() async {
  // List<CommentModel> commentModelsList = await getPostsFromFirebaseDatabase();
  // print(commentModelsList);
  var commentModels = await databaseReference.child('Comments').get();
  if (commentModels.exists) {
    var commentModelsMap = commentModels.value as Map;
    List<CommentModel> commentModelsList = [];
    for (var commentModel in commentModelsMap.values) {
      commentModelsList.add(CommentModel.fromMap(commentModel));
    }
    return commentModelsList;
  }
  return [];
}
Future<void> editCommentFromFirebaseDatabase(
    {required String commentModelId,
    required CommentModel newCommentModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    var commentModels = await databaseReference.child('Comments').get();
    if (commentModels.exists) {
      CommentModel commentModel = CommentModel();
      var commentModelsMap = commentModels.value as Map;
      for (var commentModel in commentModelsMap.values) {
        commentModel = CommentModel.fromMap(commentModel);
        if (commentModel.getCommenttId() == commentModelId) {
          databaseReference
              .child('Comments/$commentModelId')
              .update(newCommentModel.toMapForUpdate());
          break;
        }
      }
    }
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}
Future<void> deletePostFromFirebaseDatabase(
    {required String commentModelId,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await deleteCommentFromFirebase(commentModelId);
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}
Future<void> deleteCommentFromFirebase(String commentModelId) async {
  var commentModels = await databaseReference.child('Comments').get();
  if (commentModels.exists) {
    CommentModel commentModel = CommentModel();
    var commentModelsMap = commentModels.value as Map;
    for (var commentModel in commentModelsMap.values) {
      commentModel = CommentModel.fromMap(commentModel);
      if (commentModel.getCommentId() == commentModelId) {
        databaseReference.child('Comments/$commentModelId').remove();
        break;
      }
    }
  }
}
