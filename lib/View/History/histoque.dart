import 'package:dashboard/View/History/pending_task_screen.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../components.dart';
import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../drawer_menu.dart';
import 'done_task_screen.dart';

class HistoriqueScreen extends StatefulWidget {
   HistoriqueScreen({Key? key}) : super(key: key);

  @override
  State<HistoriqueScreen> createState() => _HistoriqueScreenState();
}

class _HistoriqueScreenState extends State<HistoriqueScreen> {
  PageController? taskController = PageController(initialPage: 0);

  Color first= mainColor;

  Color second =Colors.white;

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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
    children: [

    Row (
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

    HistoriqueButton(pressed: (){
    setState(() {
    taskController!.jumpToPage(0);
    second=Colors.white;
    first=mainColor;

    });


    },
    direction: true,
    text: 'Commentaire',
    containerColor: first,
    textColor: second


    ),
    HistoriqueButton(pressed: (){
    setState(() {
    taskController!.jumpToPage(1);
    second=mainColor;
    first=Colors.white;

    });



    },
    direction: false,
    text: 'Rate',
    containerColor: second,
    textColor: first


    ),
    ]
    ),
    SizedBox(height: 15,),
    Expanded(
    child: PageView(
    physics:  NeverScrollableScrollPhysics(),
    controller: taskController,
    children: [
    DoneTaskScreen(),
    PendingTaskScreen(),


    ],
    ),
    ),


    ],
    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}