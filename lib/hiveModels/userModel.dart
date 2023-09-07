import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

part 'userModel.g.dart';

@HiveType(typeId: 0) 
class User {
  @HiveField(0)
  final String? id; 

  @HiveField(1)
  final String? firstName;

  @HiveField(2)
  final String? lastName;

  @HiveField(3)
  final String? phoneNumber;

  @HiveField(4)
  final String? email;

  @HiveField(5)
  final String? username;

  @HiveField(6)
  late final String? profilePicture;

  @HiveField(7)
  final String? token;

  User({
    required this.id, 
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.profilePicture,
    required this.token,
  });

  User? copyWith({required profilePicture}) {}
}
