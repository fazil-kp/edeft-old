// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:io';
import 'package:edeft/ui_screens/admin/admin_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AdminFacultiesListPage extends StatefulWidget {
  const AdminFacultiesListPage({Key? key}) : super(key: key);

  @override
  State<AdminFacultiesListPage> createState() => _AdminFacultiesListPageState();
}

class _AdminFacultiesListPageState extends State<AdminFacultiesListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController mainStaffController = TextEditingController();
  TextEditingController staffNoController = TextEditingController();
  TextEditingController staffNoDeleteController = TextEditingController();
  List<String> designationList = [];
  List<String> nameList = [];
  List<File> profileImage = [];
  int main = 0, noOfStaff = 0;
  File? _image;

  final isDialOpen = ValueNotifier(false);

  var facultiesImage = ["https://i.postimg.cc/TwsvQz5H/img1.png", "https://i.postimg.cc/PfBP5cV4/img2.png", "https://i.postimg.cc/t4bJh6jn/img3.png", "https://i.postimg.cc/wBfB8bsD/img4.png", "https://i.postimg.cc/gkVkk0Zz/img5.png", "https://i.postimg.cc/LsXHTB05/iimg6.png", "https://i.postimg.cc/nrvZzdMR/img7.png", "https://i.postimg.cc/85vgKydp/img8.png", "https://i.postimg.cc/MK9ZjFdN/img9.png", "https://i.postimg.cc/bYCNZ56M/img10.png"];

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      img = (await cropImage(imageFile: img))!;
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      AlertDialog(
        title: const Text('Something went wrong !'),
        content: Text("Try again later....${e.toString()}"),
      );
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? cropedImage = await ImageCropper().cropImage(sourcePath: imageFile.path);
    return File(cropedImage!.path);
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: designationController,
                  decoration: InputDecoration(
                    labelText: 'Designation',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          pickImage();
                          if (_image == null) {
                            File f = File("https://i.postimg.cc/PfBP5cV4/img2.png");
                            _image = f;
                          }
                          profileImage.add(_image!);
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        )),
                    const Text(
                      "Upload Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  String name = nameController.text;
                  String designation = designationController.text;
                  // do something with name and age
                  designationList.add(designation);
                  nameList.add(name);
                  designationController.text = "";
                  nameController.text = "";
                  setState(() {
                    (nameList.length >= noOfStaff) ? noOfStaff = nameList.length : _showDialog();
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void mainStaff() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: staffNoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Number of Staff',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: mainStaffController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Number of Main Staff',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  String mainStaff = mainStaffController.text;
                  String staff = staffNoController.text;
                  // do something with name and age
                  main = int.parse(mainStaff.toString());
                  noOfStaff = int.parse(staff.toString());
                  setState(() {
                    if (main > 0) {
                      if (noOfStaff > main) {
                        _showDialog();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Number of staff must be greater'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Main staff must be greater 0 '),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  });
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void delete() {
    showDialog(
        context: context,
        builder: (BuildContext contet) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            backgroundColor: const Color(0XFF00b2ff),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  controller: staffNoDeleteController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: 'Enter  position  number ',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: staffNoController,
                  decoration: InputDecoration(
                    labelText: 'Number of staff',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  int stafs = noOfStaff;
                  String delete = staffNoDeleteController.text;
                  String staff = staffNoController.text;
                  int pos = int.parse(delete.toString());
                  noOfStaff = int.parse(staff.toString());
                  int value = pos - 1;

                  if (value < nameList.length) {
                    if (noOfStaff < stafs) {
                      mainStaff();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Check number of Staffs'),
                        ),
                      );
                      Navigator.pop(context);
                    }

                    setState(() {
                      nameList.removeAt(pos - 1);
                      designationList.removeAt(pos - 1);
                      profileImage.removeAt(pos - 1);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid input'),
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                child: const Text('Cancel', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = true;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(MaterialPageRoute(builder: (context) => const AdminHomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            'Faculties',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFfafafa),
          //Theme.of(context).accentColor,
          elevation: 0,
        ),
        body: Container(
          color: const Color(0xFFfdfdfd),
          child: ListView(children: [
            if (nameList.length == noOfStaff)
              FacultiesList(
                main: main,
                nameList: nameList,
                designationList: designationList,
                profileImage: facultiesImage,
              ),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black87,tooltip: 'Open Dialog Box',
        //   onPressed:
        //     mainStaff,
        //   child: const Icon(Icons.add,color: Colors.white,),
        // ),
        floatingActionButton: SpeedDial(
          backgroundColor: Colors.black87,
          overlayColor: Colors.black87,
          overlayOpacity: 0.4,
          spacing: 10,
          animatedIcon: AnimatedIcons.menu_close,
          openCloseDial: isDialOpen,
          children: [SpeedDialChild(child: const Icon(Icons.add), label: 'Add', onTap: mainStaff), SpeedDialChild(child: const Icon(Icons.delete), label: 'Delete', onTap: delete)],
        ),
      ),
    );
  }
}

class FacultiesList extends StatelessWidget {
  const FacultiesList({
    super.key,
    required this.main,
    required this.nameList,
    required this.designationList,
    required this.profileImage,
  });

  final int main;
  final List<String> nameList;
  final List<String> designationList;
  final List<String> profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < main; i++)
          ColumnCard(
            name: nameList[i],
            designation: designationList[i],
            profileImage: profileImage[i],
          ),
        for (int j = main; j < (nameList.length - 1); j += 2)
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RowCard(
                  name: nameList[j],
                  designation: designationList[j],
                  profileImage: profileImage[j],
                  start: 18.0,
                  end: 0.0,
                ),
                RowCard(
                  name: nameList[j + 1],
                  designation: designationList[j + 1],
                  profileImage: profileImage[j + 1],
                  start: 0.0,
                  end: 18.0,
                ),
              ],
            ),
          ),
        if (((nameList.length) - main).isOdd || (nameList.length) == 1)
          ColumnCard(
            name: nameList[nameList.length - 1],
            designation: designationList[nameList.length - 1],
            profileImage: profileImage[nameList.length - 1],
          ),
      ],
    );
  }
}

class RowCard extends StatelessWidget {
  String profileImage = "";
  String name = "";
  String designation = "";
  double start, end;

  RowCard({required this.name, required this.designation, required this.profileImage, required this.start, required this.end, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(start, 3, end, 0),
        child: SizedBox(
          child: Card(
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.vertical,
                  spacing: 9.0,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profileImage),
                      radius: 40,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 5),
                      child: Column(
                        children: [
                          Text(
                            name,
                            maxLines: 3,
                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                          ),
                          Text(
                            designation,
                            style: const TextStyle(color: Color(0xFF404040)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColumnCard extends StatelessWidget {
  String profileImage = "";
  String name = "";
  String designation = "";

  ColumnCard({
    required this.name,
    required this.designation,
    required this.profileImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 5),
      child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 17.0,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                      ),
                      Text(
                        designation,
                        style: const TextStyle(color: Color(0xFF404040)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
