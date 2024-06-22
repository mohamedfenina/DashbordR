import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

 ShowSuccesSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Container(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Icon(Icons.check_circle_rounded,
              color: greenColor,
              size: 30,),
            SizedBox(width: 15,),
            Text(message,
              style: GoogleFonts.ibmPlexSansArabic(
                  color: greenColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),),
            Spacer(),
            Icon(CupertinoIcons.xmark,size: 20,)
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color(0xffEEF6F1),

    shape: RoundedRectangleBorder(
      side: BorderSide(
          width: 1.5,
          color: greenColor
      ),

      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),
  ));
}



ShowErrorSnackBar(BuildContext context, String message, ) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Container(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Icon(Icons.cancel,
              color: redColor,
              size: 30,),
            SizedBox(width: 15,),
            Text(message,
              style: GoogleFonts.ibmPlexSansArabic(
                  color: redColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
              ),),
            Spacer(),
            Icon(CupertinoIcons.xmark,size: 20,)
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color(0xffF6EEEE),

    shape: RoundedRectangleBorder(
      side: BorderSide(
          width: 1.5,
          color: redColor
      ),

      borderRadius: BorderRadius.circular(8),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20),

  ));
}
