import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../pages/screen/add_post_screen.dart';
import '../pages/screen/feed_screen.dart';
import '../pages/screen/profile_screen.dart';
import '../pages/screen/search_screen.dart';

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  Padding(
    padding: const EdgeInsets.only(top: 50, left: 10),
    child: const Text('Notifications'),
  ),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
