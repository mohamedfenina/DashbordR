import 'package:dashboard/View/History/histoque.dart';
import 'package:dashboard/View/Post/post.dart';
import 'package:dashboard/View/Scan/scan.dart';
import 'package:dashboard/View/User/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/controller.dart';
import 'View/User/dash_board_screen.dart';
import 'dio_helper.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  DioHelper.init(
      _scaffoldKey
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller()),
        // Ajoutez d'autres providers ici si nécessaire
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Controller(),)
        ],
        child: DashBoardScreen(),
      ),
      routes: {
        '/dashboard': (context) => DashBoardScreen(),
        '/post': (context) => PostScreen(),
        '/scan': (context) => ScanScreen(),
        '/history': (context) => HistoriqueScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}




