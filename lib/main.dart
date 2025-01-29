import 'package:facerecognation/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future < void > main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB_SHlbj9ZW9zAMzxrVZiycRgx87wxAJeU', //ambil dari current_key
      appId: '1:549869601534:android:1c0fbd7b210764c23e1baf', //ambil dari mobilesdk_app_id
      messagingSenderId: '549869601534', //ambil dari project_number
      projectId: 'absensifacerecognation', //ambil dari project_id
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardTheme: CardTheme(
          surfaceTintColor: Colors.white,
        ),
        dialogTheme: DialogTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent
          ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      );
    }
  }