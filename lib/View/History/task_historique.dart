import 'package:dashboard/View/History/pending_task_screen.dart';
import 'package:flutter/material.dart';


import '../../colors.dart';
import '../../components.dart';
import 'done_task_screen.dart';


class TaskHistorique extends StatefulWidget {
  const TaskHistorique({super.key});

  @override
  State<TaskHistorique> createState() => _TaskHistoriqueState();
}

class _TaskHistoriqueState extends State<TaskHistorique> {
  PageController? taskController = PageController(initialPage: 0);

  Color first= mainColor;
  Color second =Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
