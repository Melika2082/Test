import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final List<String> categories = [
    'All',
    'Acount',
    'Hashtag',
    'Caption',
    'Story',
    'Category',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getStoryListBox(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 17,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.red,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('images/item$index.png'),
                        ),
                      ),
                    );
                  },
                  childCount: 10,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _getStoryListBox() {
    return Container(
      height: 30,
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: 18,
        left: 5,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: Color(0xff272B40),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'GM',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 17,
        left: 17,
        top: 17,
      ),
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(13),
        ),
        color: Color(0xff272B40),
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
          Image.asset('images/icon_scan.png'),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
