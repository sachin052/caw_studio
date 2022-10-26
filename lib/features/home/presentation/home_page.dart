import 'package:caw_studio/core/theme/color.dart';
import 'package:caw_studio/features/feed/presentation/feed_screen.dart';
import 'package:caw_studio/features/feed/widgets/feed_post_widget.dart';
import 'package:caw_studio/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../feed/widgets/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FeedScreen(),
      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        color:Colors.white,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child: Row( //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomBarOption(icon: Assets.imagesFeedIcon,title: "Feed",onTap: (){_onItemTapped(0);},currentSelected: _selectedIndex==0),
            BottomBarOption(icon: Assets.imagesLibraryIcon,title: "Library",onTap: (){_onItemTapped(1);},currentSelected: _selectedIndex==1),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
                backgroundColor: colorPrimary, // <-- Button color
                foregroundColor: Colors.red, // <-- Splash color
              ),
            ),
            BottomBarOption(icon: Assets.imagesMessagesIcon,title: "Messages",onTap: (){_onItemTapped(2);},currentSelected: _selectedIndex==2),
            BottomBarOption(icon: Assets.imagesServiceIcon,title: "Service",onTap: (){_onItemTapped(3);},currentSelected: _selectedIndex==3),

          ],
        ),
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}

class BottomBarOption extends StatefulWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool currentSelected;
  const BottomBarOption({Key? key, required this.icon, required this.title, required this.onTap, required this.currentSelected}) : super(key: key);

  @override
  State<BottomBarOption> createState() => _BottomBarOptionState();
}

class _BottomBarOptionState extends State<BottomBarOption> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 0.8,end: 1.0).animate(_controller)..addListener(() {setState(() {

    });});
    if(widget.currentSelected){
      _controller.forward();
    }
    else{
      _controller.reverse();
    }
  }
  @override
  Widget build(BuildContext context) {
    return _buildBottomBarOption();
  }
  Widget  _buildBottomBarOption(){
    return   InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(widget.icon,color: widget.currentSelected?colorPrimary:lightGrey),
            SizedBox(height: 4,),
            Text(widget.title,style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 11,color: widget.currentSelected?colorPrimary:lightGrey),)
          ],),
      ),
    );
  }
}

