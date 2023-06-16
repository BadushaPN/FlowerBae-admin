// import 'dart:html';

import 'dart:io';

import 'package:admin/view/widgets/bottom_navigation_bar.dart';
import 'package:admin/view/widgets/custom_button.dart';
import 'package:admin/view/widgets/large_text.dart';
import 'package:admin/view/widgets/my_textformfields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/color.dart';

class UpdateProductScreen extends StatefulWidget {
  var id;
  String name;
  UpdateProductScreen({super.key, required this.name, required this.id});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    nameController.text = widget.name;
    // final id = widget.id;
    super.initState();
  }

  // Future _getImageFromCamera() async {
  //   final pickedImage = await picker.getImage(source: ImageSource.camera);

  //   setState(() {
  //     if (pickedImage != null) {
  //       _image = File(pickedImage.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }
  String _selectedItem = 'BOUQUET';
  final List<String> _dropdownItems = [
    "BOUQUET",
    "TABLE",
    "AISLE",
    "ACCESSORIES",
  ];

  void _onItemSelected(String? item) {
    setState(() {
      _selectedItem = item!;
    });
  }

  Future _getImageFromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final CollectionReference flower =
      FirebaseFirestore.instance.collection("Flowers");
  update(id) {
    final data = {'name': nameController.text};
    flower.doc(id).update(data);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.width / 3,
              ),
              GestureDetector(
                onTap: () {
                  _getImageFromGallery;
                },
                child: SizedBox(
                  height: size.width / 3,
                  child: _image != null
                      ? Image.file(
                          _image!,
                          height: 50,
                          width: 50,
                        )
                      : SizedBox(
                          height: size.width / 4,
                          child: ClipRRect(
                            child: Image.asset("lib/assests/user.png"),
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: size.width / 6,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Product Name :",
                  letterSpacing: -0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              MyTextformFields(
                controller: nameController,
                hintText: "Product Name",
                line: 1,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: LargeText(
                  text: "Product Price :",
                  letterSpacing: -0.5,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  // color: Colors.white,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration.collapsed(
                              hintText: "Product Price",
                              hintStyle: TextStyle(
                                fontSize: 20,
                              ))),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LargeText(
                          text: "Product Category :",
                          letterSpacing: -0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: DropdownButton<String>(
                            value: _selectedItem,
                            onChanged: _onItemSelected,
                            items: _dropdownItems.map((String item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: LargeText(
                                  text: item,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: -0.5,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LargeText(
                          text: "Product Qauntity :",
                          letterSpacing: -0.5,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        width: 140,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LargeText(
                                text: "-",
                                letterSpacing: 0,
                                fontSize: 20,
                              ),
                              LargeText(
                                text: "1",
                                fontSize: 20,
                              ),
                              LargeText(
                                text: "+",
                                letterSpacing: 0,
                                fontSize: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.width / 3,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  size: size,
                  text: "Update",
                  onTap: () {
                    update(widget.id);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavigatoionBar()),
                        (route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
