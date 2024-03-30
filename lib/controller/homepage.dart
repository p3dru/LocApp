import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
   late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _tabBarView(),
      ),
    );
  }

  TabBar _tabBar(){
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          text: 'Continue With Email',
          )
        ],
      );
    }

    List<Widget> _tabBarView(){
      return [
        Center(
          child: LoginPage(title: 'Tab 1',),
        ),
      ];
    }

}