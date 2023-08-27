import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shohaara/models/UserModel.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DatabaseReference? dbRef =
      FirebaseDatabase.instance.ref().child('users-details');

  Future<String?> signUpWithEmailAndPassword({
    required String name,
    required String lastName,
    required String phoneNumber,
    required String email,
    required String username,
    required String password,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        print(uid);

        Map<String, dynamic> userDetails = {
          'userId': uid,
          'name': name,
          'lastName': lastName,
          'phoneNumber': phoneNumber,
          'email': email,
          'username': username,
        };

        await dbRef!.child(uid).set(userDetails);
        whenComplete();
        return null;
      } else {
        print('There is some error');
        onError('User creation failed');
        return 'User creation failed';
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      onError(e.toString());
      return e.toString();
    }
  }

  Future<String?> signInWithEmailAndPassword({
    required String email,
    required String password,
    required Function() whenComplete,
    required Function(String) onError,
  }) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      if (userCredential.user != null) {
        String uid = userCredential.user!.uid;
        print('User successfully signed in');
        print(uid);

        whenComplete();
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await _firestore.collection('users-details').doc(uid).get();

        if (userSnapshot.exists) {
          UserModel user = UserModel.fromMap(userSnapshot.data()!);

          print('Name: ${user.getUserFirstName()} ${user.getUserLastName()}');
          print('Phone: ${user.getUserPhone()}');
          return null;
        } else {
          onError('User data not found');
          return 'User data not found';
        }
      } else {
        print('There is some error');
        onError('Sign-in failed');
        return 'Sign-in failed';
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      onError(e.toString());
      return e.toString();
    }
  }
}
