import 'package:flutter/material.dart';

import '../../colors.dart';


class RapportComponent extends StatefulWidget {
   RapportComponent({super.key, required this.raport, required this.rapportList,  });
   bool raport;
    final Map<String,dynamic> rapportList;


  @override
  State<RapportComponent> createState() => _RapportComponentState();
}

class _RapportComponentState extends State<RapportComponent> {
  @override
  Widget build(BuildContext context) {
    double columnWidth = MediaQuery.of(context).size.width / 2.7; // Set the width dynamically
    List<DataRow> getRows() {
      return widget.rapportList.entries.map((entry) {
        return DataRow(cells: [
          DataCell(Container(width: columnWidth, child: Text(entry.key,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
            color: Colors.black
          ),))),
          DataCell(Container(width: columnWidth, child: Text(entry.value.toStringAsFixed(2),
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.black
            ),))),
        ]);
      }).toList();
    }





    return Column
      (
      children: [


        TextButton(onPressed: (){
          setState(() {
            widget.raport = !widget.raport;
          });

        },
          child: Row(
            children: [
              Expanded(
                child: Text('Rapport Generale',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    )),
              ),


              Icon(widget.raport?Icons.keyboard_arrow_up :Icons.keyboard_arrow_down_outlined,
        size: 35,
              color: Colors.black),
            ],
          ),),
        Visibility(
          visible: widget.raport,
          child: DataTable(
            columnSpacing: 20,
            border: TableBorder.all(
              width: 2,
              color: Colors.grey
            ),


            columns:  [
              DataColumn(label: Text('Nom Produit',
              style: TextStyle(
                color: mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700
              )),),
              DataColumn(label: Text('Quantité',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  )),),
            ],
            rows: getRows(),
          ),

            // Column(
            //
            //   children: [
            //      Row(
            //         children: [
            //
            //
            //
            //           Expanded(
            //             child: Container(
            //               padding: EdgeInsetsDirectional.all(5),
            //               decoration: BoxDecoration(
            //                   border: Border.all(
            //                       color: Colors.grey,
            //                       width: 1
            //                   )
            //               ),
            //               child: Text(
            //                 'Produit',style: TextStyle
            //                 (color: Colors.black,
            //                   fontSize: 20,
            //               fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Container(
            //               padding: EdgeInsetsDirectional.all(5),
            //               decoration: BoxDecoration(
            //                   border: Border.all(
            //                       color: Colors.grey,
            //                       width: 1
            //                   )
            //               ),
            //               child: Text(
            //                 'Quantite Total',style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 20,
            //               fontWeight: FontWeight.bold),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //
            //     for( var item in widget.rapportList.entries)
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //
            //
            //           Expanded(
            //             child: Container(
            //               padding: EdgeInsetsDirectional.all(5),
            //               decoration: BoxDecoration(
            //                 border: Border.all(
            //                   color: Colors.grey,
            //                   width: 1
            //                 )
            //               ),
            //               child: Text(
            //                 '${item.key}',style: TextStyle
            //                 (color: Colors.black,
            //               fontSize: 20),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: Container(
            //               padding: EdgeInsetsDirectional.all(5),
            //               decoration: BoxDecoration(
            //                   border: Border.all(
            //                       color: Colors.grey,
            //                       width: 1
            //                   )
            //               ),
            //               child: Text(
            //                 '${item.value}',style: TextStyle(
            //                   color: Colors.black,
            //               fontSize: 20),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //   ],
            // ),
          ),

      ],
    );
  }


}
