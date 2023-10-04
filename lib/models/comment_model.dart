class CommentModel {
  final String id;
  final String text;
  final Map<String, dynamic> userID;
  final String postID;
  final DateTime createdAt;
  final DateTime updatedAt;

  CommentModel({
    required this.id,
    required this.text,
    required this.userID,
    required this.postID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
  return CommentModel(
    id: json['_id'] ?? '',
    text: json['text'] ?? '',
    userID: json['userID'] is Map<String, dynamic>
        ? Map<String, dynamic>.from(json['userID'])
        : {},
    postID: json['postID'] ?? '',
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
      'userID': userID,
      'postID': postID,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String()
    };
  }
}
