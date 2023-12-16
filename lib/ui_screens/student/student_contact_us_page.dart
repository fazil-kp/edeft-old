import 'package:edeft/ui_screens/student/student_home_page.dart';
import 'package:flutter/material.dart';

class StudentContactUsPage extends StatelessWidget {
  const StudentContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StudentHomePage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height / 10),
          const Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text(
              'Get in touch!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 10,
              ),
              const Icon(
                Icons.call,
                color: Color(0XFF00b2ff),
              ),
              SizedBox(
                width: size.width / 50,
              ),
              const Text('+91 9087654321'),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 10,
              ),
              const Icon(
                Icons.mail,
                color: Color(0XFF00b2ff),
              ),
              SizedBox(
                width: size.width / 50,
              ),
              const Text('rnacademy@gmail.com'),
            ],
          ),
          SizedBox(
            height: size.height / 30,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 10,
              ),
              const Icon(
                Icons.location_on,
                color: Color(0XFF00b2ff),
              ),
              SizedBox(
                width: size.width / 50,
              ),
              const Text('RNA Academy, Calicut, Kerala'),
            ],
          ),
        ],
      ),
    );
  }
}
