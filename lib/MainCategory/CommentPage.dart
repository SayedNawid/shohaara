import 'package:flutter/material.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/models/PostModel.dart';
import 'package:shohaara/models/comment_model.dart';
import 'package:shohaara/services/api_service.dart';
import 'package:shohaara/services/post_services.dart';

class CommentPage extends StatefulWidget {
  final String postId;
  final List<Map<String, dynamic>> initialComments;

  CommentPage({Key? key, required this.postId, required this.initialComments})
      : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Map<String, dynamic>> comments = [];
  bool isLoading = false;
  TextEditingController commentController = TextEditingController();

  String formatDate(String dateStr) {
    try {
      final DateTime date = DateTime.tryParse(dateStr) ?? DateTime.now();
      final String day = date.day.toString();
      final String month = _getMonthName(date.month);
      final String year = date.year.toString();
      return '$day $month $year';
    } catch (e) {
      return dateStr;
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
    comments = widget.initialComments;
  }

  void addComment() async {
    final newCommentText = commentController.text;

    try {
      await PostService.addComment(
        postId: widget.postId,
        text: newCommentText,
        onSuccess: (CommentModel comment) {
          print(comment);
          setState(() {
            comments.add(comment.toMap());
            commentController.clear();
          });
        },
        onError: (String error) {
          print('Error adding comment: $error');
        },
      );
    } catch (e) {
      print('Exception while adding comment: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("شعراء"),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: commentController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'افزدون نظر...',
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: addComment,
              child: Text(
                'ذخیره',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: kSecondrayColor,
              ),
            ),
            SizedBox(height: 20),
            comments.isEmpty
                ? Center(
                    child: Text("No comments available."),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      final username = comment['userID']['username'];
                      final createdAt = comment['createdAt'];
                      final formattedDate = formatDate(createdAt);

                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        shadowColor: Colors.grey.withOpacity(0.5),
                        child: ListTile(
                          title: Text(comment['text']),
                          subtitle: Text('By: $username • $formattedDate'),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
