// Import hive and path_provider packages
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

part 'post_model.g.dart';


@HiveType(typeId: 1) // The typeId must be unique@HiveType(typeId: 0)
class post_model {
  @HiveField(0)
  final String? UserId;

  @HiveField(1)
  final String? PostimageUrl;

  @HiveField(2)
  final String? PostText;

  @HiveField(3)
  final String? postDate;

  @HiveField(4)
  final String? PostLike;

  post_model({
    required this.UserId,
    required this.PostimageUrl,
    required this.PostText,
    required this.postDate,
    required this.PostLike,
  });
}