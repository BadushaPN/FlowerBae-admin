import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Screen'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Tab 1',
              icon: Icon(Icons.tab),
            ),
            Tab(
              text: 'Tab 2',
              icon: Icon(Icons.tab),
            ),
            Tab(
              text: 'Tab 3',
              icon: Icon(Icons.tab),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [],
      ),
    );
  }
}
