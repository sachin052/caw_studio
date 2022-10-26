import 'package:caw_studio/features/feed/presentation/cubit/feed_cubit.dart';
import 'package:caw_studio/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entity/feed_post_ui_entity.dart';
import '../widgets/feed_post_widget.dart';
import '../widgets/home_header.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late FeedCubit feedCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feedCubit=getIt<FeedCubit>()..fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<FeedCubit,FeedState>(
        bloc: feedCubit,
        builder: (_,state){
          if(state is FeedSuccess){
            return _buildHome(state.items);
          }
          else if(state is FeedError){
            return Center(child:Text(state.errorMessage));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  Widget _buildHome(List<FeedPostUIEntity> items){
    return DefaultTabController(
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
              child: Column(children: items.map((e) => Column(children: [
                const Divider(thickness: 5,),
                FeedPostWidget(feedPostUIEntity: e),
              ],)).toList(),),
            )
        ),
      ),
    );
  }
}
