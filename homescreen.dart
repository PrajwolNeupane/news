import 'package:flutter/material.dart';
import 'package:global_news/Screens/Common_Screen.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 8, vsync: this);
    super.initState();
  }

  int _selectedindex = 0;

  @override
  TextStyle head(double size) {
    return TextStyle(
        color: HexColor("#484953"),
        fontFamily: "NEB",
        fontSize: MediaQuery.of(context).size.width * size);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("##ffffff"),
      appBar: AppBar(
        backgroundColor: HexColor("##ffffff"),
        elevation: 0.0,
        title: Text(
          "Global News",
          style: head(0.07),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          labelStyle: head(0.06),
          labelColor: HexColor("#484953"),
          unselectedLabelColor: HexColor("#b2b1b8"),
          isScrollable: true,
          indicatorColor: HexColor("#6d43ec"),
          tabs: [
            Tab(text: "Technology"),
            Tab(text: "Sports"),
            Tab(text: "Bussiness"),
            Tab(text: "Entertainment"),
            Tab(text: "Environment"),
            Tab(text: "Food"),
            Tab(text: "Health"),
            Tab(text: "Science ")
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        Common_Screen("technology"),
        Common_Screen("sports"),
        Common_Screen("business"),
        Common_Screen("entertainment"),
        Common_Screen('environment'),
        Common_Screen("food"),
        Common_Screen("health"),
        Common_Screen("science")
      ]),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        selectedItemColor: HexColor("#6d43ec"),
        unselectedItemColor: HexColor("#b2b1b8"),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: MediaQuery.of(context).size.width * 0.095,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_outlined,
                size: MediaQuery.of(context).size.width * 0.095,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_outlined,
                size: MediaQuery.of(context).size.width * 0.095,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_rounded,
                size: MediaQuery.of(context).size.width * 0.095,
              ),
              label: "")
        ],
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
    );
  }

  Widget body1() {
    return Center(
      child: Text("body1"),
    );
  }

  Widget body2() {
    return Center(
      child: Text("body2"),
    );
  }
}
