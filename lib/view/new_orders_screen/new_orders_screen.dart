import 'package:admin/utils/color.dart';
import 'package:flutter/material.dart';

class NewOrdersScreen extends StatefulWidget {
  const NewOrdersScreen({super.key});

  @override
  State<NewOrdersScreen> createState() => _NewOrdersScreenState();
}

class _NewOrdersScreenState extends State<NewOrdersScreen> {
  @override
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // give the tab bar a height [can change hheight to preferred height]
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: dark,
                    ),
                    labelColor: light,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'New Orders',
                      ),
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Pending Orders',
                      ),

                      // second tab [you can add an icon using the icon property]
                    ],
                  ),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Text("no"), Text("data")
                      // first tab bar view widget

                      // second tab bar view widget
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
