import 'package:instagram/screens/shareIconButtonWidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Map<String, String>> stories = [
    {'image': 'images/profile.png', 'text': 'amirah...'},
    {'image': 'images/image1.png', 'text': 'Maha...'},
    {'image': 'images/image2.png', 'text': 'Mojavad'},
    {'image': 'images/image3.png', 'text': 'Webq.co'},
    {'image': 'images/image4.png', 'text': 'S_mojavad'},
    {'image': 'images/profile.png', 'text': 'amirah...'},
    {'image': 'images/image1.png', 'text': 'Maha...'},
    {'image': 'images/image4.png', 'text': 'S_mojavad'},
    {'image': 'images/image2.png', 'text': 'Mojavad'},
    {'image': 'images/image3.png', 'text': 'Webq.co'},
    {'image': 'images/image4.png', 'text': 'S_mojavad'},
  ];

  List<String> postImages = [
    'images/post_cover.png',
    'images/item4.png',
    'images/item1.png',
    'images/item0.png',
    'images/item3.png',
    'images/item9.png',
    'images/item2.png',
    'images/item7.png',
    'images/item5.png',
    'images/item6.png',
    'images/item8.png',
  ];

  int maxPosts = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0,
        title: Container(
          width: 128,
          height: 24,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(
              right: 18,
            ),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _getAddStoryBox();
                    } else {
                      return _getStoryListBox(index - 1);
                    }
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      _getHeaderPost(index),
                      SizedBox(
                        height: 20,
                      ),
                      _getPostContent(index),
                    ],
                  );
                },
                childCount: stories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _getPostContent(int index) {
    if (index >= postImages.length || postImages[index] == false) {
      return Container();
    }
    return Container(
      height: 420,
      width: 385,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 385,
                width: 385,
                child: Image.asset(
                  postImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Image.asset('images/icon_video.png'),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2.6 k',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '1.5 k',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      shareIconButtonWidget(),
                      SizedBox(
                        width: 40,
                      ),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _getHeaderPost(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Row(
        children: [
          _getStoryBox(index),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stories[index]['text']!,
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'امیراحمد ادیبی برنامه نویس موبایل',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  DottedBorder _getStoryBox(int index) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      dashPattern: [40, 10],
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset(stories[index]['image']!),
        ),
      ),
    );
  }

  Container _getStoryListBox(int index) {
    if (index >= stories.length ||
        stories[index]['image'] == null ||
        stories[index]['text'] == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            dashPattern: [40, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Container(
                height: 56,
                width: 56,
                child: Image.asset(stories[index]['image']!),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            stories[index]['text']!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          Text(
            'Your Story',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
