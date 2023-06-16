import 'package:admin/utils/color.dart';
import 'package:admin/view/add_product_screen/add_product_screen.dart';
import 'package:admin/view/update_product_screen/update_product.dart';
import 'package:admin/view/widgets/custom_button.dart';
import 'package:admin/view/widgets/large_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/location.dart';
import 'widget/profile_home_screen.dart';

class HomePag extends StatefulWidget {
  const HomePag({super.key});

  @override
  State<HomePag> createState() => _HomePagState();
}

class _HomePagState extends State<HomePag> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  deleteFlower(docId) {
    flower.doc(docId).delete();
  }

  final CollectionReference flower =
      FirebaseFirestore.instance.collection("Flowers");

  @override
  Widget build(BuildContext context) {
    flower.get();
    // flower.snapshots();
    TabController? _tabcontroller;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: CustomButton(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductAddingScreen()));
          },
          size: size,
          text: 'Add Product',
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: size.height / 28,
          ),
          Align(
            alignment: Alignment.center,
            child: LargeText(text: "FlowerBae"),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfileHomeScreen(onTap: () {}),
                    ),
                    LargeText(
                      text: "Hi,Badusha",
                      fontSize: 20,
                      letterSpacing: 0,
                    ),
                  ],
                ),
                Location(size: size),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: size.width / 8,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(30)),
              child: TextField(
                controller: textEditingController,
                onChanged: (val) {},
                decoration: InputDecoration(
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                    onDoubleTap: () => Navigator.pop(context),
                    child: IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: dark,
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                  ),
                  hintText: 'Search product',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: flower.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: double.infinity,
                  height: size.width * 1.12,
                  color: Colors.amber,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      // Access the document data
                      var documentData = snapshot.data!.docs[index];

                      // Customize the display of the document data
                      // Example: Display the 'name' field
                      var name = documentData['name'];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onLongPress: () =>
                              _showDeleteDialog(context, documentData.id),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProductScreen(
                                        name: name,
                                        id: documentData.id,
                                      ))),
                          child: Container(
                            color: white,
                            child: Text(name),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("No data");
              }
            },
          )
        ],
      )),
    );
  }

  void _showDeleteDialog(BuildContext context, docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Confirmation'),
          content: Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                deleteFlower(docId);
                // Perform delete operation
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                // Cancel the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
