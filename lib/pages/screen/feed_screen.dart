import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/post_card.dart';
import '../../utils/themes.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MusaTheme.colorBackground,
      appBar: AppBar(
        backgroundColor: MusaTheme.colorBackground,
        centerTitle: false,
        title: SvgPicture.asset(
          'assets/images/MUSA_logo.svg',
          color: MusaTheme.buttonColor,
          height: 32,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.messenger_outline,
              color: MusaTheme.buttonColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Container(
              margin: EdgeInsets.symmetric(
                horizontal:  1,
                vertical:  1,
              ),
              child: PostCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            ),
          );
        },
      ),
    );
  }
}