// ignore_for_file: depend_on_referenced_packages
import 'package:edeft/DB/provider.dart';
import 'package:edeft/common_elements/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        

        
        ChangeNotifierProvider(create: (_) => MyData()),
        ChangeNotifierProvider(create: (context) => StudentModelProvider()),
        ChangeNotifierProvider(create: (context) => FacultyModelProvider()),
        ChangeNotifierProvider(create: (context) => StudyMaterialsModelProvider()),
        ChangeNotifierProvider(create: (context) => AssignmentListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'edeft',
      home: SplashScreen(),
    );
  }
}
