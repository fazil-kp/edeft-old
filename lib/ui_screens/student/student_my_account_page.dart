import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../DB/provider.dart';

class StudentMyAccountPage extends StatefulWidget {
  const StudentMyAccountPage({Key? key}) : super(key: key);

  @override
  State<StudentMyAccountPage> createState() => _StudentMyAccountPageState();
}

class _StudentMyAccountPageState extends State<StudentMyAccountPage> {
  String? username;
  File? _image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      img = (await cropImage(imageFile: img))!;

      // final storageRef = FirebaseStorage.instance.ref();
      // final mountainsRef = storageRef.child('$image');
      // final mountainImagesRef = storageRef.child('$img');
      //
      // assert(mountainsRef.name == mountainImagesRef.name);
      // assert(mountainsRef.fullPath != mountainImagesRef.fullPath);

      // try {
      //   await mountainsRef.putFile(img);
      // } on FirebaseException catch (e) {
      //   AlertDialog(title:const Text('Something went wrong !'),content: Text("Try again later....${e.toString()}"),);
      // }

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
    CroppedFile? croppedImage = await ImageCropper().cropImage(sourcePath: imageFile.path);
    return File(croppedImage!.path);
  }

  bool _personalInfoEditing = false;
  bool _addressInfoEditing = false;
  bool _parentsInfoEditing = false;
  final bool _academicInfoEditing = false;
  final String dobLabel = "Date of Birth", genderLabel = "Gender", phoneLabel = "Phone Number", emailLabel = "email", schoolLabel = "School Name";
  final String houseLabel = "House Name", placeLabel = "Place", postLabel = "Post Office", cityLabel = "City", districtLabel = "District", stateLabel = "State";
  final String fatherLabel = "Father", fatherPhoneLabel = "Phone Number", motherLabel = "Mother", motherPhoneLabel = "Phone Number", guardianLabel = "Guardian", guardianRelationLabel = "Relation", guardianMobileLabel = "Mobile Number";
  final String rollNumberLabel = "Roll Number", regNoLabel = "Exam Register Number", admissionDateLabel = "Admission Date", batchLabel = "Batch", classLabel = "Class";
  final _personalInfo = GlobalKey<FormState>();
  final _addressInfo = GlobalKey<FormState>();
  final _parentsInfo = GlobalKey<FormState>();
  final _academicInfo = GlobalKey<FormState>();

  FormValidation frm = FormValidation();

  DateTime dateTime = DateTime(2020, 12, 01);

  @override
  Widget build(BuildContext context) {
    final studentModelProvider = Provider.of<StudentModelProvider>(context);
    final student = studentModelProvider.studentModel;

    final studentCard = student?.STUDENT_CARD;
    final personalDetails = student?.PERSONAL_DETAILS;
    final address = student?.ADDRESS;
    final parentDetails = student?.PARENT_DETAILS;
    final academicDetails = student?.ACADEMIC_DETAILS;

    String profileImage, studentName, studentClass, studentRegNo;

    profileImage = studentCard![3];
    studentName = studentCard[0];
    studentClass = studentCard[1];
    studentRegNo = studentCard[2];

    TextEditingController dobCtrl = TextEditingController(text: personalDetails![0]);
    TextEditingController genderCtrl = TextEditingController(text: personalDetails[1]);
    TextEditingController studentPhoneCtrl = TextEditingController(text: personalDetails[2]);
    TextEditingController studentEmailCtrl = TextEditingController(text: personalDetails[3]);
    TextEditingController schoolCtrl = TextEditingController(text: personalDetails[4]);

    TextEditingController houseNameCtrl = TextEditingController(text: address![0]);
    TextEditingController placeNameCtrl = TextEditingController(text: address[1]);
    TextEditingController postOfficeCtrl = TextEditingController(text: address[2]);
    TextEditingController cityNameCtrl = TextEditingController(text: address[3]);
    TextEditingController districtNameCtrl = TextEditingController(text: address[4]);
    TextEditingController stateNameCtrl = TextEditingController(text: address[5]);

    TextEditingController fatherNameCtrl = TextEditingController(text: parentDetails![0]);
    TextEditingController fatherPhoneCtrl = TextEditingController(text: parentDetails[1]);
    TextEditingController motherNameCtrl = TextEditingController(text: parentDetails[2]);
    TextEditingController motherPhoneCtrl = TextEditingController(text: parentDetails[3]);
    TextEditingController guardianNameCtrl = TextEditingController(text: parentDetails[4]);
    TextEditingController guardianRelationCtrl = TextEditingController(text: parentDetails[5]);
    TextEditingController guardianPhoneCtrl = TextEditingController(text: parentDetails[6]);

    TextEditingController rollNumberCtrl = TextEditingController(text: academicDetails![0]);
    TextEditingController examRegisterNumberCtrl = TextEditingController(text: academicDetails[1]);
    TextEditingController admissionDateCtrl = TextEditingController(text: academicDetails[2]);
    TextEditingController batchCtrl = TextEditingController(text: academicDetails[3]);
    TextEditingController classCtrl = TextEditingController(text: academicDetails[4]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'My Account',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 18, 4, 18),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  spacing: 8.0,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 58,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: (_image != null)
                                ? Image.file(
                                    _image!,
                                    width: 116,
                                    height: 116,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(profileImage),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -25,
                          child: RawMaterialButton(
                            onPressed: pickImage,
                            elevation: 2.0,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            shape: const CircleBorder(),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          studentName,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Text(
                          studentClass,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          studentRegNo,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 18),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Form(
                        key: _personalInfo,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    child: Text(
                                      'Personal Information',
                                      style: Theme.of(context).textTheme.displayLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _personalInfoEditing = !_personalInfoEditing;
                                        });
                                        if (_personalInfo.currentState!.validate() && _personalInfoEditing == false) {
                                          _personalInfo.currentState!.save();
                                        } else {
                                          setState(() {
                                            _personalInfoEditing = true;
                                          });
                                        }
                                      },
                                      icon: Icon(_personalInfoEditing ? Icons.check : Icons.edit_note),
                                      label: Text(_personalInfoEditing ? "Save" : "Edit"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                                decoration: buildInputDecoration(dobLabel),
                                enabled: _personalInfoEditing,
                                keyboardType: TextInputType.none,
                                controller: dobCtrl,
                                validator: (value) {
                                  if (value == null) {
                                    return "Please enter your date of birth";
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  final date = await pickDate();
                                  if (date != null) {
                                    setState(() {
                                      dateTime = date;
                                      dobCtrl.text = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
                                    });
                                  } else {
                                    setState(() {
                                      dobCtrl.text = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
                                    });
                                  }
                                }),
                            TextFormField(
                              decoration: buildInputDecoration(genderLabel),
                              enabled: _personalInfoEditing,
                              controller: genderCtrl,
                              // onChanged: (value) {
                              //   setState(() {
                              //     genderCtrl.text= value;
                              //   });
                              // },
                              validator: (value) {
                                return frm.validateGender(value!);
                              },
                              onSaved: (value) => genderCtrl.text = value!,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(phoneLabel),
                              enabled: _personalInfoEditing,
                              controller: studentPhoneCtrl,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                return frm.validateMobile(value!);
                              },
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(emailLabel),
                              enabled: _personalInfoEditing,
                              keyboardType: TextInputType.emailAddress,
                              controller: studentEmailCtrl,
                              validator: (value) {
                                return frm.validateEmail(value!);
                              },
                            ),
                            TextFormField(
                                decoration: buildInputDecoration(schoolLabel),
                                enabled: _personalInfoEditing,
                                controller: schoolCtrl,
                                validator: (value) {
                                  return frm.validateString(value!);
                                }),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 18),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Form(
                        key: _addressInfo,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    child: Text(
                                      'Address',
                                      style: Theme.of(context).textTheme.displayLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _addressInfoEditing = !_addressInfoEditing;
                                        });
                                        if (_addressInfo.currentState!.validate() && _addressInfoEditing == false) {
                                          _addressInfo.currentState!.save();
                                        } else {
                                          setState(() {
                                            _addressInfoEditing = true;
                                          });
                                        }
                                      },
                                      icon: Icon(_addressInfoEditing ? Icons.check : Icons.edit_note),
                                      label: Text(_addressInfoEditing ? "Save" : "Edit"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(houseLabel),
                              enabled: _addressInfoEditing,
                              controller: houseNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                              // keyboardType: TextInputType.datetime,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(placeLabel),
                              enabled: _addressInfoEditing,
                              controller: placeNameCtrl,
                              keyboardType: TextInputType.streetAddress,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                              onSaved: (value) => placeNameCtrl.text = value!,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(postLabel),
                              enabled: _addressInfoEditing,
                              controller: postOfficeCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(cityLabel),
                              enabled: _addressInfoEditing,
                              controller: cityNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(districtLabel),
                              enabled: _addressInfoEditing,
                              controller: districtNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                            ),
                            TextFormField(
                                decoration: buildInputDecoration(stateLabel),
                                enabled: _addressInfoEditing,
                                controller: stateNameCtrl,
                                validator: (value) {
                                  return frm.validateString(value!);
                                }),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 18),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Form(
                        key: _parentsInfo,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    child: Text(
                                      'Parents Information',
                                      style: Theme.of(context).textTheme.displayLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _parentsInfoEditing = !_parentsInfoEditing;
                                        });
                                        if (_parentsInfo.currentState!.validate() && _parentsInfoEditing == false) {
                                          _parentsInfo.currentState!.save();
                                        } else {
                                          setState(() {
                                            _parentsInfoEditing = true;
                                          });
                                        }
                                      },
                                      icon: Icon(_parentsInfoEditing ? Icons.check : Icons.edit_note),
                                      label: Text(_parentsInfoEditing ? "Save" : "Edit"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(fatherLabel),
                              enabled: _parentsInfoEditing,
                              controller: fatherNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                              // keyboardType: TextInputType.datetime,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(fatherPhoneLabel),
                              enabled: _parentsInfoEditing,
                              controller: fatherPhoneCtrl,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                return frm.validateMobile(value!);
                              },
                              onSaved: (value) => fatherPhoneCtrl.text = value!,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(motherLabel),
                              enabled: _parentsInfoEditing,
                              controller: motherNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(motherPhoneLabel),
                              enabled: _parentsInfoEditing,
                              keyboardType: TextInputType.phone,
                              controller: motherPhoneCtrl,
                              validator: (value) {
                                return frm.validateMobile(value!);
                              },
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(guardianLabel),
                              enabled: _parentsInfoEditing,
                              controller: guardianNameCtrl,
                              validator: (value) {
                                return frm.validateString(value!);
                              },
                            ),
                            TextFormField(
                                decoration: buildInputDecoration(guardianRelationLabel),
                                enabled: _parentsInfoEditing,
                                controller: guardianRelationCtrl,
                                validator: (value) {
                                  return frm.validateString(value!);
                                }),
                            TextFormField(
                              decoration: buildInputDecoration(guardianMobileLabel),
                              enabled: _parentsInfoEditing,
                              controller: guardianPhoneCtrl,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                return frm.validateMobile(value!);
                              },
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 15, 18, 18),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Form(
                        key: _academicInfo,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                    child: Text(
                                      'Academic Information',
                                      style: Theme.of(context).textTheme.displayLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(rollNumberLabel),
                              enabled: _academicInfoEditing,
                              controller: rollNumberCtrl,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(regNoLabel),
                              enabled: _academicInfoEditing,
                              controller: examRegisterNumberCtrl,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(admissionDateLabel),
                              enabled: _academicInfoEditing,
                              controller: admissionDateCtrl,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(batchLabel),
                              enabled: _academicInfoEditing,
                              controller: batchCtrl,
                            ),
                            TextFormField(
                              decoration: buildInputDecoration(classLabel),
                              enabled: _academicInfoEditing,
                              controller: classCtrl,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1980), lastDate: DateTime.now());

  Future<void> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('userName').toString();

    setState(() {});
  }
}

class FormValidation {
  String? validateGender(String value) {
    String pattern = r'(^(male|female|prefer not to say)$)';
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (value.isEmpty) {
      return 'Input is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid input (Ex: Male,Female,Prefer not to say)';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z\d._]+@[a-zA-Z\d]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Phone Number is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid phone number ';
    }
    return null;
  }

  String? validateString(String value) {
    String pattern = r"^[a-z ]{3,17}$";
    RegExp regExp = RegExp(pattern, caseSensitive: false);
    if (value.isEmpty) {
      return 'Input is required';
    } else if (!regExp.hasMatch(value)) {
      if (value.length > 17) {
        return 'Maximum character exceeded';
      } else {
        return 'Please enter valid input';
      }
    }
    return null;
  }
}

InputDecoration buildInputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(
      fontSize: 15,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
  );
}
