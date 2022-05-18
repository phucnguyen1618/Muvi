import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:Muvi/shared/widgets/tab/movie_widget.dart';
import 'package:Muvi/shared/widgets/tab/tv_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(12.0),
                child: const SegmentedTabControl(
                  height: 32.0,
                  radius: Radius.circular(16.0),
                  backgroundColor: Colors.amberAccent,
                  tabTextColor: Colors.white,
                  tabs: [
                    SegmentTab(
                      label: 'TV SHOW',
                      color: Colors.amberAccent,
                      backgroundColor: Colors.grey,
                    ),
                    SegmentTab(
                      backgroundColor: Colors.grey,
                      label: 'MOVIE',
                      textColor: Colors.amberAccent,
                      color: Colors.amberAccent,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    TVWidget(),
                    MovieWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}