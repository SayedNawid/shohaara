// Import hive and path_provider packages
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

part 'userModel.g.dart';

@HiveType(typeId: 0) // The typeId must be unique@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final String? firstName;

  @HiveField(1)
  final String? lastName;

  @HiveField(2)
  final String? phoneNumber;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? username;

  @HiveField(5)
  final String? profilePicture;

  @HiveField(6)
  final String? token;

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.profilePicture,
    required this.token,
  });
}
