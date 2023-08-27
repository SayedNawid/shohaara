import 'package:flutter/material.dart';

String userId = 'user_id';
String userFirstName = 'user_first_name';
String userLastName = 'user_last_name';
String userPhone = 'user_phone';
String userProfileUrl = 'user_profile_url';
String userPassword = 'user_password';
String userUserName = 'user_user_name';
String userEmail = 'user_email';

class UserModel {
  late final String _userId;
  late final String _userFirstName;
  late final String _userLastName;
  late final String _userPhone;
  late final String _userProfileUrl;
  late final String _userPassword;
  late final String _user_userName;
  late final String _userEmail;

  UserModel({required String userEmail});

  UserModel.init({
    required String userId,
    required String userFirstName,
    required String userLastName,
    required String userPhone,
    required String userProfileUrl,
    required String userPassword,
    required String user_userName,
    required String userEmail,
  }) {
    _userId = userId;
    _userFirstName = userFirstName;
    _userLastName = userLastName;
    _userPhone = userPhone;
    _userProfileUrl = userProfileUrl;
    _userPassword = userPassword;
    _user_userName = user_userName;
    _userEmail = userEmail;
  }

  UserModel.fromMap(Map<dynamic, dynamic> json) {
    _userId = json[userId] ?? '';
    _userFirstName = json[userFirstName] ?? '';
    _userLastName = json[userLastName] ?? '';
    _userPhone = json[userPhone] ?? '';
    _userProfileUrl = json[userProfileUrl] ?? '';
    _userPassword = json[userPassword] ?? '';
    _user_userName = json[userUserName] ?? '';
    _userEmail = json[userEmail] ?? '';
  }

  Map<String, Object> toMap() {
    return {
      userId: getUserId(),
      userFirstName: getUserFirstName(),
      userLastName: getUserLastName(),
      userPhone: getUserPhone(),
      userProfileUrl: getUserProfileUrl(),
      userPassword: getUserPassword(),
      userUserName: getUser_userName(),
      userEmail: getUserEmail()
    };
  }

  Map<String, Object> toMapForUpdate() {
    return {
      userId: getUserId(),
      userFirstName: getUserFirstName(),
      userLastName: getUserLastName(),
      userPhone: getUserPhone(),
      userProfileUrl: getUserProfileUrl(),
      userPassword: getUserPassword(),
      userUserName: getUser_userName(),
      userEmail: getUserEmail()
    };
  }

  String getUserId() => _userId;
  String getUserFirstName() => _userFirstName;
  String getUserLastName() => _userLastName;
  String getUserPhone() => _userPhone;
  String getUserProfileUrl() => _userProfileUrl;
  String getUserPassword() => _userPassword;
  String getUser_userName() => _user_userName;
  String getUserEmail() => _userEmail;
}
