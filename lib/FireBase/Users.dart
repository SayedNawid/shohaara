import 'package:flutter/material.dart';

import '../packages/UserModel.dart';
import 'firebase_realtime_database.dart';

Future<void> addUserToFirebaseDatabase(
    {required UserModel userModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await databaseReference
        .child('Users/${userModel.getUserId()}')
        .set(userModel.toMap());
    whenComplete();
    print('complete');
  } catch (error) {
    onError(error.toString());
  }
}

Future<List<UserModel>> getUsersFromFirebaseDatabase() async {
  // List<UserModel> userModelsList = await getUsersFromFirebaseDatabase();
  // print(userModelsList);
  var userModels = await databaseReference.child('Users').get();
  if (userModels.exists) {
    var userModelsMap = userModels.value as Map;
    List<UserModel> userModelsList = [];
    for (var userModel in userModelsMap.values) {
      userModelsList.add(UserModel.fromMap(userModel));
    }
    return userModelsList;
  }
  return [];
}

Future<void> editUserFromFirebaseDatabase(
    {required String userModelId,
    required UserModel newUserModel,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    var userModels = await databaseReference.child('Users').get();
    if (userModels.exists) {
      UserModel userModel = UserModel();
      var userModelsMap = userModels.value as Map;
      for (var userModel in userModelsMap.values) {
        userModel = UserModel.fromMap(userModel);
        if (userModel.getUserId() == userModelId) {
          databaseReference
              .child('Users/$userModelId')
              .update(newUserModel.toMapForUpdate());
          break;
        }
      }
    }
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}

Future<void> deleteUserFromFirebaseDatabase(
    {required String userModelId,
    required Function() whenComplete,
    required Function(String) onError}) async {
  try {
    await deleteUserFromFirebase(userModelId);
    whenComplete();
  } catch (error) {
    onError(error.toString());
  }
}

Future<void> deleteUserFromFirebase(String userModelId) async {
  var userModels = await databaseReference.child('Users').get();
  if (userModels.exists) {
    UserModel userModel = UserModel();
    var userModelsMap = userModels.value as Map;
    for (var userModel in userModelsMap.values) {
      userModel = UserModel.fromMap(userModel);
      if (userModel.getUserId() == userModelId) {
        databaseReference.child('Users/$userModelId').remove();
        break;
      }
    }
  }
}
