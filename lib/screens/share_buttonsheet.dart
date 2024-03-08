import 'package:flutter/material.dart';
import 'dart:ui';

class ShareButtonSheet extends StatelessWidget {
  ShareButtonSheet({this.controller, super.key});

  final ScrollController? controller;

  List<Map<String, String>> profile = [
    {'image': 'images/profile.png', 'text': 'amirah...'},
    {'image': 'images/image1.png', 'text': 'Maha...'},
    {'image': 'images/image2.png', 'text': 'Mojavad'},
    {'image': 'images/image3.png', 'text': 'Webq.co'},
    {'image': 'images/image4.png', 'text': 'S_moja...'},
    {'image': 'images/image5.png', 'text': 'sara_11'},
    {'image': 'images/image6.png', 'text': 'zohreh'},
    {'image': 'images/image7.png', 'text': 'abc123'},
    {'image': 'images/image8.png', 'text': 'abbas'},
    {'image': 'images/image9.png', 'text': 'sina'},
    {'image': 'images/image10.png', 'text': 'yasaman'},
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(36),
        topRight: Radius.circular(36),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 35,
          ),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 22,
                    ),
                    height: 5,
                    width: 67,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Share',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GB',
                            fontSize: 20,
                          ),
                        ),
                        Image.asset('images/icon_share_bottomsheet.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(13),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 13,
                            right: 0,
                          ),
                          child: Image.asset('images/icon_search.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 11,
                (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(profile[index]['image']!),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        profile[index]['text']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'GB',
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 28,
                mainAxisSpacing: 38,
                mainAxisExtent: 90,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Text(
                'Send',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'GB',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
