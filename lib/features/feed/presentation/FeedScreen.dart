import 'package:flutter/material.dart';

import '../../authentication/domain/entiity/feed_post_ui_entity.dart';
import '../widgets/feed_post_widget.dart';
import '../widgets/home_header.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(

                    expandedHeight: 170.0,
                    floating: false,
                    collapsedHeight: 70,
                    pinned: true,
                    backgroundColor: Colors.white,
                    flexibleSpace: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: const SingleChildScrollView(
                        child: HomeHeader(),
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(children: [
                  const Divider(thickness: 5,),
                  FeedPostWidget(feedPostUIEntity: FeedPostUIEntity.generateDummyMOdel()),
                  const Divider(thickness: 5,),
                  FeedPostWidget(feedPostUIEntity: FeedPostUIEntity.generateDummyMOdel())
                ],),
              )
          ),
        ),
      ),
    );
  }
}
