import 'package:flutter/material.dart';
import 'package:shohaara/constants.dart';
import 'package:shohaara/main_page.dart';
import 'package:shohaara/services/api_service.dart';
import 'package:shohaara/services/fetcher.dart';
import 'package:shohaara/services/post_services.dart';
import 'SpalshScreens/OnBoardingSceen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shohaara/hiveModels/userModel.dart';
import 'package:shohaara/hiveModels/postModel.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PostAdapter());

  try {
    await Firebase.initializeApp();
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  await Hive.openBox<User>('users');

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ApiService.getUserFromHive();
    _getUserData();
  }

  Future<void> _getUserData() async {
    final userBox = await Hive.openBox<User>('users');
    final user = userBox.get('user');

    if (user != null) {
      await PostService.fetchPosts(whenComplete: () {}, onError: () {});
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const MainPage()),
      );
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
