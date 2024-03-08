import 'package:flutter/material.dart';
import 'package:instagram/model/enums/activity_type_enums.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: TabBar(
                controller: _tabController,
                unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
                indicatorColor: Color(0xffF35383),
                indicatorWeight: 3,
                labelColor: Color(0xffF35383),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomScrollView _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: _getRow(ActivityStatus.followBack),
            ),
            childCount: 2,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: _getRow(ActivityStatus.likes),
            ),
            childCount: 4,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This Week',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: _getRow(ActivityStatus.following),
            ),
            childCount: 4,
          ),
        ),
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                child: Image.asset('images/profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Amirahmadadibi',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GB',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Started Following',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      color: Color(0xffC5C5C5),
                      fontFamily: 'GM',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              child: Image.asset('images/item7.png'),
              fit: BoxFit.cover,
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Color(0xffC5C5C5),
              fontFamily: 'GM',
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              color: Color(0xffC5C5C5),
              fontFamily: 'GM',
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        );
    }
  }
}
