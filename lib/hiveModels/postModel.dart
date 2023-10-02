import 'package:hive/hive.dart';


part 'postModel.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  final Object UserId;

  @HiveField(1)
  final String PostimageUrl;

  @HiveField(2)
  final String PostText;

  @HiveField(3)
  final String postDate;

  @HiveField(4)
  final List<dynamic> PostLike;

  @HiveField(5) 
  final DateTime createdAt;

  @HiveField(6) 
  final DateTime updatedAt;

  Post({
    required this.UserId,
    required this.PostimageUrl,
    required this.PostText,
    required this.postDate,
    required this.PostLike,
    required this.createdAt, 
    required this.updatedAt, 
  });

  static fromJson(Map<String, dynamic> postMap) {}
}
