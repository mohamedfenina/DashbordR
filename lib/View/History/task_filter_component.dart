
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../colors.dart';
import '../../components.dart';




class TaskFilterComponent extends StatefulWidget {
  TaskFilterComponent({super.key, required this.onApplyFilter, required this.categorieList,  category,category1, required this.firstdate, required this.lastDate, required this.done, required this.categorieList1});
   final Function(DateTime,DateTime, String?,String?) onApplyFilter;
   final List<String> categorieList ;
   final List<String> categorieList1 ;
     String? category;
     String? category1;
   final DateTime firstdate;
   final DateTime lastDate;
   final bool done;

  @override
  State<TaskFilterComponent> createState() => _TaskFilterComponentState();
}

class _TaskFilterComponentState extends State<TaskFilterComponent> {
  DateTime first = DateTime.now();
  DateTime last = DateTime.now();

  String? selectedValue = null ;
  String? selectedValue1 = null ;
  final TextEditingController textEditingController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  selectedValue =widget.category;
  selectedValue1 =widget.category1;
    first =widget.firstdate;
    last =widget.lastDate;
    print(selectedValue);





  }






  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,


      child: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom:0,top: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black54,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: 80,
                height: 5,

              ),
            ),





            Visibility(
              visible: widget.done,
              child: Column(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nom User',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w600
                        )),
                        Container(
                          margin: EdgeInsets.only(top: 8,bottom: 15),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                             borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: mainColor,
                              width: 2
                            )
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              iconStyleData: IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down_outlined,
                                size: 30,)
                              ),

                              isExpanded: true,
                              hint: Text(
                                '${selectedValue != null ? selectedValue : 'Selectioner un User'}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: widget.categorieList
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 200,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)

                                  ),
                                maxHeight: 200
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              // dropdownSearchData: DropdownSearchData(
                              //   searchController: textEditingController,
                              //   searchInnerWidgetHeight: 50,
                              //   searchInnerWidget: Container(
                              //     height: 50,
                              //     padding: const EdgeInsets.only(
                              //       top: 8,
                              //       bottom: 4,
                              //       right: 8,
                              //       left: 8,
                              //     ),
                              //     child: TextFormField(
                              //       expands: true,
                              //       maxLines: null,
                              //       controller: textEditingController,
                              //       decoration: InputDecoration(
                              //         isDense: true,
                              //         contentPadding: const EdgeInsets.symmetric(
                              //           horizontal: 10,
                              //           vertical: 8,
                              //         ),
                              //         hintText: 'Search for an item...',
                              //         hintStyle: const TextStyle(fontSize: 12),
                              //         border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(8),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              //   searchMatchFn: (item, searchValue) {
                              //     return item.value.toString().contains(searchValue);
                              //   },
                              // ),
                              //This to clear the search value when you close the menu
                              // onMenuStateChange: (isOpen) {
                              //   if (!isOpen) {
                              //     textEditingController.clear();
                              //   }
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nom product',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 8,bottom: 15),
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: mainColor,
                                  width: 2
                              )
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              iconStyleData: IconStyleData(
                                  icon: Icon(Icons.keyboard_arrow_down_outlined,
                                    size: 30,)
                              ),

                              isExpanded: true,
                              hint: Text(
                                '${selectedValue1 != null ? selectedValue1 : 'Selectioner un produit'}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: widget.categorieList1
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black
                                  ),
                                ),
                              ))
                                  .toList(),
                              value: selectedValue1,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue1 = value;
                                });
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 200,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)

                                  ),
                                  maxHeight: 200
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                              // dropdownSearchData: DropdownSearchData(
                              //   searchController: textEditingController,
                              //   searchInnerWidgetHeight: 50,
                              //   searchInnerWidget: Container(
                              //     height: 50,
                              //     padding: const EdgeInsets.only(
                              //       top: 8,
                              //       bottom: 4,
                              //       right: 8,
                              //       left: 8,
                              //     ),
                              //     child: TextFormField(
                              //       expands: true,
                              //       maxLines: null,
                              //       controller: textEditingController,
                              //       decoration: InputDecoration(
                              //         isDense: true,
                              //         contentPadding: const EdgeInsets.symmetric(
                              //           horizontal: 10,
                              //           vertical: 8,
                              //         ),
                              //         hintText: 'Search for an item...',
                              //         hintStyle: const TextStyle(fontSize: 12),
                              //         border: OutlineInputBorder(
                              //           borderRadius: BorderRadius.circular(8),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              //   searchMatchFn: (item, searchValue) {
                              //     return item.value.toString().contains(searchValue);
                              //   },
                              // ),
                              //This to clear the search value when you close the menu
                              // onMenuStateChange: (isOpen) {
                              //   if (!isOpen) {
                              //     textEditingController.clear();
                              //   }
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),


         Center(
           child: Row(
             children: [
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Date debut',
                         style: TextStyle(
                             color: Colors.black,
                             fontSize: 13,
                             fontWeight: FontWeight.w600
                         )),

                     TextButton(
                       onPressed: (){
                         setState(() {
                           _selectDateFirst(context);
                         });


                       },
                       child: Container(
                         height: 55,
                         width: 250,
                         margin: EdgeInsets.only(top: 5,bottom: 15),

                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                           border: Border.all(
                             color: mainColor,
                             width: 2,
                           ),
                           borderRadius: BorderRadius.circular(10)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Icon(Icons.calendar_month_outlined,
                             color: Colors.black),
                             Text('${DateFormat('yyyy-MM-dd').format(first)}',
                               style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.w500,
                                 fontSize: 18
                               ),),
                             Icon(Icons.arrow_circle_up,
                             color: Colors.black),
                           ],
                         ),

                       ),
                     ),
                   ],
                 ),
               ),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Date fin',
                         style: TextStyle(
                             color: Colors.black,
                             fontSize: 13,
                             fontWeight: FontWeight.w600
                         )),

                     TextButton(
                       onPressed: (){
                         setState(() {
                           _selectDateLast(context);
                         });


                       },
                       child: Container(
                         height: 55,
                         width: 250,
                         margin: EdgeInsets.only(top: 5,bottom: 15),

                         padding: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             border: Border.all(
                               color: mainColor,
                               width: 2,
                             ),
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Icon(Icons.calendar_month_outlined,
                                 color: Colors.black),
                             Text('${DateFormat('yyyy-MM-dd').format(last)}',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 18
                               ),),
                             Icon(Icons.arrow_circle_up,
                                 color: Colors.black),
                           ],
                         ),

                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),


            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddButton(
                  text: 'Clear',
                  pressed: (){
                    setState(() {
                      selectedValue = null;

                      first = DateTime.now();
                      last = DateTime.now();
                    });


                  },
                  color: Colors.red,


                ),
                SizedBox(width: 15,),
                AddButton(
                  text: 'Apply',
                  pressed: (){


                      widget.onApplyFilter(first, last , selectedValue,selectedValue1);
                      Navigator.of(context).pop(); // Close the bottom sheet



                  },
                  color: Colors.green,


                ),

              ],
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _selectDateFirst(BuildContext context, ) async {
    final DateTime? picked = await showDatePicker(

      context: context,
      initialDate: first,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            // Customize the date picker theme here
            colorScheme: ColorScheme.light(
              primary: mainColor, // Change primary color
              onPrimary: Colors.white, // Change text color on primary color

            ),

          ), child: child!,);
      },
    );

    if (picked != null && picked != first) {
      setState(() {
        first = picked;

        print(first);
      });
    }
  }
  Future<void> _selectDateLast(BuildContext context, ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: last,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
          // Customize the date picker theme here
            colorScheme: const ColorScheme.light(
              primary: mainColor, // Change primary color
              onPrimary: Colors.white, // Change text color on primary color

            ),

        ), child: child!,);
      },
    );

    if (picked != null && picked != last) {
      setState(() {
        last = picked;

        print(last);
      });
    }
  }
}
