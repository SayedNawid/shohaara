import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shohaara/hiveModels/userModel.dart';
import 'package:shohaara/services/api_service.dart';
import 'package:shohaara/services/post_services.dart';
import '../constants.dart';
import 'CommentPage.dart';
import 'package:shohaara/models/post_model.dart';

class PostItem extends StatefulWidget {
  final PostModel post;
  final String userId;

  const PostItem({
    required this.post,
    required this.userId,
    Key? key,
  }) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}


class _PostItemState extends State<PostItem> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    checkLiked();
  }

  void checkLiked() {
    print("UserID: ${ApiService.loggedInUser?.id}");
    // print("Likes: ${widget.post.likes}");
    setState(() {
      isLiked = widget.post.likes.contains(ApiService.loggedInUser?.id);
      likeCount = widget.post.likes.length;
    });
  }
  // void checkLiked() {
  //   if (widget.post.likes.contains(ApiService.loggedInUser?.id)) {
  //     setState(() {
  //       isLiked = true;
  //     });
  //     print(isLiked);
  //   } else {
  //     setState(() {
  //       isLiked = false;
  //     });
  //     print(isLiked);

  //   }
  //   setState(() {
  //     likeCount = widget.post.likes.length;
  //   });
  // }

  void updateLikeState() {
    final int postIndex =
        PostService.posts.indexWhere((post) => post['_id'] == widget.post.id);
    // print("UserID: ${ApiService.loggedInUser?.id}");
    // print("Likes: ${widget.post.likes}");
    if (postIndex != -1) {
      final List<dynamic> postLikes = PostService.posts[postIndex]['likes'];
      if (postLikes.contains(ApiService.loggedInUser?.id)) {
        postLikes.remove(ApiService.loggedInUser?.id);
        setState(() {
          isLiked = false;
        });
        print(postLikes);
      } else {
        postLikes.add(ApiService.loggedInUser?.id);
        print(postLikes);
        setState(() {
          isLiked = true;
        });
      }
       
      setState(() {
        likeCount = postLikes.length;
      });
      print(likeCount);
    }
  }

  String formatDate(String dateStr) {
    try {
      final DateTime date = DateTime.tryParse(dateStr) ?? DateTime.now();

      final String day = date.day.toString();
      final String month = date.month.toString();
      // final String month = _getMonthName(date.month);
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shadowColor: kPrimaryColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(35, 55),
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: kPrimaryColor,
                    ),
                    label: const Text(""),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        // (post.userID as Map<String, dynamic>?)?['name'] ?? '',
                        widget.post.userID['firstName'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: "Vazir",
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        formatDate(widget.post.createdAt.toString()),
                        style: const TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        widget.post.userID['profilePicture'] ?? ''),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: kPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 100,
                child: Text(
                  widget.post.text ?? '',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: "Vazir",
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 170,
              child: Image.network(widget.post.photo ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(35, 55),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_outline_outlined,
                        color: kPrimaryColor,
                      ),
                      label: const Text(""),
                    ),
                    const Spacer(),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(35, 55),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CommentPage(),
                          ),
                        );
                      },
                      icon: Text(
                        widget.post.likes.length.toString(),
                        style: const TextStyle(
                          fontFamily: "Vazir",
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      label: const Icon(
                        FontAwesomeIcons.comment,
                        color: kPrimaryColor,
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(35, 55),
                        elevation: 0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        updateLikeState();
                        PostService.likePost(widget.post.id);
                      },
                      label: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : kPrimaryColor,
                      ),
                      icon: Text(
                        likeCount.toString(),
                        style: const TextStyle(
                          fontFamily: "Vazir",
                          color: kPrimaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
