import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: appPadding),
          padding: EdgeInsets.symmetric(
            horizontal: appPadding,
            vertical: appPadding / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/images/photo3.jpg',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              if(!Responsive.isMobile(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding / 2),
                child: Text('Hii, Arinalis',style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w800,
                ),),
              )
            ],
          ),
        )
      ],
    );
  }
}
