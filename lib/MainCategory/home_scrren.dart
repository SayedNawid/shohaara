import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shohaara/LoginScreens/sign_in_page.dart';
import 'package:shohaara/MainCategory/edit_profile.dart';
import 'package:shohaara/MainCategory/postItem.dart';
import 'package:shohaara/models/post_model.dart'; // Import the correct Post class
import 'package:shohaara/hiveModels/userModel.dart';
import 'package:shohaara/services/fetcher.dart';
import 'package:shohaara/services/post_services.dart';
import '../constants.dart';
import 'CommentPage.dart';
import 'CreatePost.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final userBox = await Hive.openBox<User>('users');
    final user = userBox.get('user');
    if (user != null) {
      setState(() {
        userData = user;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const SignInPage()),
      );
    }
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await PostService.fetchPosts(
          whenComplete: () {
            setState(() {
              _isLoading = false;
            });
          },
          onError: () {
             setState(() {
              _isLoading = false;
            });
          });
    } catch (error) {
      print('Failed to fetch posts. Error: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refreshPosts,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => CreatePost()),
                      ),
                    );
                  },
                  child: Text(
                    "آیا کدام شعر جدید دارید",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontFamily: "Vazir",
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    backgroundColor: Colors.white,
                    minimumSize: const Size(315, 50),
                    elevation: 0,
                    side: BorderSide(
                      color: kPrimaryColor,
                    ),
                    shadowColor: kPrimaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              if (_isLoading)
                CircularProgressIndicator() // Show a loader while fetching posts
              else
                ListView.builder(
                  itemCount: PostService.posts.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final postMap = PostService.posts[index];
                    final post = PostModel.fromJson(postMap);
                    return PostItem(
                      post: post,
                      userId: '',
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
