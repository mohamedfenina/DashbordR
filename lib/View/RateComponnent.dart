import 'package:dashboard/colors.dart';
import 'package:flutter/material.dart';

class RateComponent extends StatefulWidget {
   RateComponent({super.key, required this.rate, required this.check});
  int rate;
   final Function check;

  @override
  State<RateComponent> createState() => _RateComponentState();
}

class _RateComponentState extends State<RateComponent> {

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 80,
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return IconButton(onPressed: (){
                setState(() {
                  widget.rate = index;
                  widget.check(index);
                });

              },
                  icon:Icon(
                      widget.rate >= index ? Icons.star :Icons.star_border,
                    color: mainColor,
                  ));
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 5,);
            }, itemCount: 5),
      ),
    );
  }
}
