import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controller/controller.dart';
import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../custom_appbar.dart';
import '../drawer_menu.dart';
import 'dashboard_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(),
     // key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
            children :[
            if (Responsive.isDesktop(context))
              Expanded(child: DrawerMenu(),),
              Expanded(
                flex: 5,
                child: Center(
                  child: Text('Hello Profile', style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
        ),
      ),
    );
  }
}