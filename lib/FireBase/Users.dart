import '../models/UserModel.dart';
import 'firebase_realtime_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<User?> signUpWithEmailAndPassword({
  required String email,
  required String password,
  required Function() whenComplete,
  required Function(String) onError,
}) async {
  try {
    final authResult = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    if (authResult.user != null) {
      whenComplete();
      return authResult.user;
    } else {
      onError('User creation failed');
      return null;
    }
  } catch (e) {
    onError(e.toString());
    return null;
  }
}

Future<User?> signInWithEmailAndPassword({
  required String email,
  required String password,
  required Function() whenComplete,
  required Function(String) onError,
}) async {
  try {
    final authResult = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (authResult.user != null) {
      whenComplete();
      return authResult.user;
    } else {
      onError('Sign in failed');
      return null;
    }
  } catch (e) {
    onError(e.toString());
    return null;
  }
}

Future<void> signOut() async {
  await _auth.signOut();
}

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
      UserModel userModel = UserModel(userEmail: '');
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
    UserModel userModel = new UserModel(userEmail: userEmail);
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
