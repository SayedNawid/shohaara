import 'package:flutter/material.dart';

import '../packages/PostModel.dart';
import 'firebase_realtime_database.dart';

Future<void> addPostToFirebaseDatabase(
    {required PostModel postModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await databaseReference
        .child('Posts/${postModel.getPostId()}')
        .set(postModel.toMap());
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}

Future<List<PostModel>> getPostsFromFirebaseDatabase() async {
  // List<PostModel> postModelsList = await getPostsFromFirebaseDatabase();
  // print(postModelsList);
  var postModels = await databaseReference.child('posts').get();
  if (postModels.exists) {
    var postModelsMap = postModels.value as Map;
    List<PostModel> postModelsList = [];
    for (var postModel in postModelsMap.values) {
      postModelsList.add(PostModel.fromMap(postModel));
    }
    return postModelsList;
  }
  return [];
}
Future<void> editPostFromFirebaseDatabase(
    {required String postModelId,
    required PostModel newPostModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    var postModels = await databaseReference.child('posts').get();
    if (postModels.exists) {
      PostModel postModel = PostModel();
      var postModelsMap = postModels.value as Map;
      for (var postModel in postModelsMap.values) {
        postModel = PostModel.fromMap(postModel);
        if (postModel.getPostId() == postModelId) {
          databaseReference
              .child('posts/$postModelId')
              .update(newPostModel.toMapForUpdate());
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
    {required String postModelId,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await deletePostFromFirebase(postModelId);
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}

Future<void> deletePostFromFirebase(String postModelId) async {
  var postModels = await databaseReference.child('posts').get();
  if (postModels.exists) {
    PostModel postModel = PostModel();
    var postModelsMap = postModels.value as Map;
    for (var postModel in postModelsMap.values) {
      postModel = PostModel.fromMap(postModel);
      if (postModel.getPostId() == postModelId) {
        databaseReference.child('posts/$postModelId').remove();
        break;
      }
    }
  }
}


 // addPostToFirebaseDatabase(
    //     postModel: PostModel.init(),
    //     whenComplete: () {
    //       print('success');
    //     },
    //     onError: (error) {
    //       print('error: $error');
    //     });

// check loginScreen
    // Future<PostModel> getPostsFromFirebaseDatabase(String userName, String password) async {
//   // List<PostModel> postModelsList = await getPostsFromFirebaseDatabase();
//   // print(postModelsList);
//   var postModels = await databaseReference.child('posts').get();
//   if (postModels.exists) {
//     var postModelsMap = postModels.value as Map;
//     for (var postModel in postModelsMap.values) {
//       if (postModel['username'] == userName && postModel['password'] == password) {
//         return postModel;
//       }
//     }
//   }
//   return PostModel();
// }