class PostModel {
  final String id;
  final String text;
  final String photo;
  final List<dynamic> likes;
  final Map<String, dynamic> userID;
  final DateTime createdAt;
  final DateTime updatedAt;

  PostModel({
    required this.id,
    required this.text,
    required this.photo,
    required this.likes,
    required this.userID,
    required this.createdAt,
    required this.updatedAt,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'] ?? '',
      text: json['text'] ?? '',
      photo: json['photo'] ?? '',
      likes: json['likes'] != null ? List<dynamic>.from(json['likes']) : [],
      userID: json['userID'] != null
          ? Map<String, dynamic>.from(json['userID'])
          : {},
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt']) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt']) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'photo': photo,
      'likes': likes,
      'userID': userID,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String()
    };
  }
}
