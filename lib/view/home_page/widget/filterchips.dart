import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  /// List of Tab Bar Item
  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
    "Post",
    "Activity",
    "Setting",
    "Profile",
  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person
  ];
  int current = 0;

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          /// CUSTOM TABBAR
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                                ? Colors.white70
                                : Colors.white54,
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            border: current == index
                                ? Border.all(
                                    color: Colors.deepPurpleAccent, width: 2)
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: current == index,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                shape: BoxShape.circle),
                          ))
                    ],
                  );
                }),
          ),

          /// MAIN BODY
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            height: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[current],
                  size: 200,
                  color: Colors.deepPurple,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  items[current],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
