





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'colors.dart';



Widget FirstText({
  required String text,

})=>
    Text(text,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: textColors
    ),);
Widget SecondText({
  required String text,
  Color color = textColors,
  double fontSize = 15



})=>
    Text(text,style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: textColors,

    ),textAlign: TextAlign.center,);


Widget ThirdText({
  required String text,
  Color color= textColors,


})=>
    Text(text,style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: color,
    ),);






PreferredSizeWidget AppBarComponent({
  required String text,
  Function? pressed,
  bool pop = false,
  bool center = false,
  Color color = Colors.white,
  List<Widget>? action,


})=>
    AppBar(
      automaticallyImplyLeading: false,

      backgroundColor: color,
      elevation: 0,
      centerTitle: center,
      title: FirstText(text: text),
      leading:pop ?IconButton(
        onPressed: (){
          pressed!();
        },
        icon: Icon(Icons.arrow_back_ios_new,
          color: mainColor,),
      ):null,
      actions: action,

    );


// login button is the buuton of sign in and sign up oin diffrent pages
Widget LoginButton({
  required Color ContainerColor ,
  required String text,
  required Function pressed,
  bool loading = false,
})=>
    Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ContainerColor,
        borderRadius: BorderRadius.circular(8),
      ),

      child: TextButton(onPressed: (){
        pressed();
      },
        child: loading ? CircularProgressIndicator(
          color: Colors.white,
        ) :Text(text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 22
          ),),
      ),
    );

// Text Form field for all form fields in the app

Widget defaultFormField({
  required TextEditingController contoller,
  required TextInputType type,
  Function? submited,
  bool readonly = false,

  Function? tab,
  Function? suffixPressed,
  required Function validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword =false,
  Color color = mainColor,



})=>
    TextFormField(
      readOnly: readonly,

      controller: contoller ,
      keyboardType: type,

      validator: (String? value){
        return validate(value);
      },


      onTap: ()
      {
        tab!();
      },

      style: TextStyle(fontSize: 22.0, color: Colors.black),

      cursorColor: color ,
      obscureText: isPassword,
      decoration: InputDecoration(

        labelText: label,
        fillColor: Colors.white,
        filled: true,
        labelStyle:  TextStyle(
            fontSize: 20,
            color: color,
            fontWeight: FontWeight.w500
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
              color: color,
              width: 3
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: redColor,
            width: 2.0,
          ),
        ),




        prefixIcon: prefix != null ? Icon(prefix,
          color:color,
        ) : null,
        suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,color: mainColor,),onPressed: (){
          suffixPressed!();
        },
        ) : null,

      ),
    );


Widget defaultFormField1({
  required TextEditingController contoller,
  required TextInputType type,
  Function? submited,
  Function? change,
  Function? tab,
  Function? suffixPressed,
  Function? gener,
  required Function validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword =false,
  Color color = mainColor,


})=>
    Row(
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(

            maxLengthEnforcement: MaxLengthEnforcement.none,
            readOnly: true,



            controller: contoller ,
            keyboardType: type,

            validator: (String? value){
              return validate(value);
            },
            onFieldSubmitted: (String value)
            {
              submited!(value);
            },
            onChanged: (String value)
            {
              change!(value);
            },
            onTap: ()
            {
              tab!();
            },

            style: TextStyle(fontSize: 22.0, color: Colors.black),

            cursorColor: color ,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: label,
              fillColor: Colors.white,
              filled: true,
              hintStyle:  TextStyle(
                  fontSize: 20,
                  color: color,
                  fontWeight: FontWeight.w500
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                ),
                borderSide: BorderSide(
                    color: color,
                    width: 3
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)
                ),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),






              prefixIcon: prefix != null ? Icon(prefix,
                color:color,
              ) : null,
              suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,color: mainColor,),onPressed: (){
                suffixPressed!();
              },
              ) : null,



            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: (){
              gener!();

            },
            child: Container(

              height: 70,
              width: 120,
              child: Center(
                child: Text('Générer Code',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                  ),),
              ),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)
                ),
              ),
            ),
          ),
        ),
      ],
    );



Widget buildTasksItem(
    Map model

    )
=>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(

        children: [
          CircleAvatar(
            radius: 40,
            child: Text(
              '${model['time']}',
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '${model['title']}'
              ),
              Text(
                '2 april 2021',
              ),
            ],
          )
        ],
      ),
    );


Widget AddButton({

  required Function pressed,
  required String text,
  Color color = const Color(0xFF252c4a),
  double width = 140,
  double height= 60,
  bool loading = false,




})=>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),

      child: MaterialButton(onPressed: (){
        pressed();
      }, child:loading ?CircularProgressIndicator(color: Colors.white,):
      Text(text,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white
        ),),
      ),
    );





Widget TaskListItemEmp(
    {
      required QueryDocumentSnapshot<Object?> document,
      required String time,
      required  dynamic change,

    }


    )=>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('${time}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                )),
          ),
        ),



        Expanded(
          child: Container(
            height: 160,
            width: double.infinity,

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 2
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),

                  ),
                ]
            ),
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: (){
                change();
              },
              child: Row(

                children: [

                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('${document['name']}',style: TextStyle(
                                color: mainColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              padding: EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 8),

                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(20),

                              ),
                              child: Text('En attente',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),




                        Text("Description : ",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,



                        ),

                        ),
                        SizedBox(height: 7,),
                        Text("${'${document['description']}'}",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,



                        ),
                          maxLines: 3,

                        ),
// Text("product.description.toString().characters.take(50)...",style: TextStyle(
// color: Colors.blueGrey,
// fontSize: 15,
// ),
// ),



                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ],
    );
Widget TaskListItemAdmin(
    {
      required QueryDocumentSnapshot<Object?> document,
      required String time,
      required  dynamic change,
      required bool isSwitched,
      required Function delete,
      required Function edit,
      required List<String> day,


    }


    )=>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 65,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text('${time}',
                style: TextStyle(
                    color: textColors,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                )),
          ),
        ),
        Expanded(
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 2
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),

                  ),
                ]
            ),
            padding: EdgeInsets.all(5.0),
            child: MaterialButton(
              onPressed: (){
                edit();
              },
              child: Row(

                children: [

                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [





                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('${document['name']}',
                                maxLines: 2,
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),


                            Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                change(value);
                              },
                              activeTrackColor: Colors.blue,
                              activeColor: mainColor,
                            ),



                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),




                        Text("Description : ",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,



                        ),

                        ),
                        SizedBox(height: 7,),
                        Text("${'${document['description']}'}",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,

                        ),
                          maxLines: 3,


                        ),
                        Spacer(),
                        Container(
                          width: double.infinity,
                          height: 20,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: day.length == 7 ? 1 :day.length,
                            itemBuilder: (context, index) {

                              return Text(
                                day.length ==7 ? 'Chaque Jour' :day[index],
                                style: TextStyle(fontSize: 15.0,
                                    color: greenColor  ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 5,
                              );
                            },
                          ),
                        ),



                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ],
    );



Widget EmployeListItem(
    {
      required QueryDocumentSnapshot<Object?> document,
      required Function Update,



    }


    )=>
    Container(

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),
      padding: EdgeInsets.all(5.0),
      child: MaterialButton(
        onPressed: (){
          Update();
        },
        child: Row(

          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
                child: Text('${document['name'][0].toString().toUpperCase()}',
                    style: TextStyle(color: Colors.white,
                        fontSize: 25)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  Text('${document['name']}',style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,



                  ),
                    maxLines: 1,

                  ),
                  SizedBox(
                    height: 7,
                  ),




                  Text("Post : ${document['post']}",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,



                  ),

                  ),
                  SizedBox(height: 7,),
                  Text("Num : ${document['number']}",style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,



                  ),

                  ),
// Text("product.description.toString().characters.take(50)...",style: TextStyle(
// color: Colors.blueGrey,
// fontSize: 15,
// ),
// ),



                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
              color: mainColor,
              size: 30,)

          ],
        ),
      ),
    );

Widget HistoriqueButton({
  required Function pressed,
  required Color textColor,
  required Color containerColor,
  required String text,
  required bool direction,


})=>Expanded(
  child: Container(


    width: double.infinity,
    padding: EdgeInsets.all( 5, ),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.horizontal(left: direction ? Radius.circular(10) : Radius.circular(0),
        right:  direction ? Radius.circular(0) : Radius.circular(10),
      ),
      border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 2
      ),
    ),
    child:   TextButton(
      onPressed: (){
        pressed();

      },

      child: Center(
        child: Text('$text',
          style: TextStyle(
            color: textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,


          ),
        ),
      ),
    ),
  ),
);


Widget HistoriqueItem ({

  required Map<String, dynamic> document,





})=>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),
      padding: EdgeInsetsDirectional.all(10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:   Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text('Produit : ${document['product']}',



                  style: TextStyle(



                      color: Colors.black,



                      fontWeight: FontWeight.w700,



                      fontSize: 23



                  ),maxLines: 1,

                ),

                SizedBox(

                  height: 10,

                ),

                Text('Par : ${document['user']}',

                  style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.w600,

                      fontSize: 18

                  ),),

                SizedBox(

                  height: 5,

                ),
                Text('Commentaire : ${document['content']}',

                  style: TextStyle(

                      color: Colors.grey,

                      fontWeight: FontWeight.w600,

                      fontSize: 14

                  ),),



                SizedBox(

                  height: 5,

                ),



              ],

            ),
          ),

        ],
      ),
    );
Widget HistoriqueItem2 ({

  required Map<String, dynamic> document,





})=>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),
      padding: EdgeInsetsDirectional.all(10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child:   Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text('Produit : ${document['product']}',



                  style: TextStyle(



                      color: Colors.black,



                      fontWeight: FontWeight.w700,



                      fontSize: 23



                  ),maxLines: 1,

                ),

                SizedBox(

                  height: 10,

                ),

                Text('Par : ${document['user']}',

                  style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.w600,

                      fontSize: 18

                  ),),

                SizedBox(

                  height: 5,

                ),
                Text('Rate : ${document['rate']}',

                  style: TextStyle(

                      color: Colors.grey,

                      fontWeight: FontWeight.w600,

                      fontSize: 14

                  ),),



                SizedBox(

                  height: 5,

                ),



              ],

            ),
          ),

        ],
      ),
    );


Widget HistoriqueItemP({

  required Map<String, dynamic> document,
  required String time,
  required String realiserIn,
  required bool task ,


})=>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),
      padding: EdgeInsetsDirectional.all(10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Titre : ${document['name']}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 23
                  ),
                  maxLines: 1,),
                SizedBox(
                  height: 10,
                ),

                Text('Heure de la tâche : $time',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16
                  ),),


              ],
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 8),

            decoration: BoxDecoration(
              color: task == true ? greenColor : orangeColor,
              borderRadius: BorderRadius.circular(20),

            ),
            child: Text(task == true ?'Terminé' : 'En attente',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                )),
          )
        ],
      ),
    );



Widget CategorieItem ({
  required String nameUser,
  required String nameProduct,
  required String Commentaire,
  required Function pressed,
  required Function delete,
  required Function edit,

})=>Container(

  width: double.infinity,
  height: 180,
  padding: EdgeInsetsDirectional.all(20),
  margin: EdgeInsetsDirectional.all(20),
  decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(20),

      border: Border.all(

          color: Colors.grey.withOpacity(0.5),

          width: 2

      ),

      color: Colors.white,

      boxShadow: [

        BoxShadow(

          color: Colors.grey.withOpacity(0.5),

          spreadRadius: 1,

          blurRadius: 2,

          offset: Offset(0, 1),



        ),

      ]

  ),


  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('le Commentaire :   ${Commentaire}',
              maxLines: 2,
              style: TextStyle(

                color: Colors.grey,

                fontWeight: FontWeight.bold,

                fontSize: 30,


              ),),


            Column(
              children: [
                Row(
                  children: [
                    Text('Ecrire par : ',style: TextStyle(

                      color: Colors.blue,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),
                      maxLines: 1,),
                    Text('${nameUser}',style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),
                      maxLines: 1,),
                  ],
                ),
                SizedBox(width: 50,),
                Row(
                  children: [
                    Text('le Produit : ',style: TextStyle(

                      color: Colors.blue,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),),
                    Text('${nameProduct}',style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),),                  ],
                ),
              ],
            ),




          ],



        ),
      ),
      PopupMenuButton(
        onSelected: (String result){
          if (result == 'Delete' ){
            delete();
          }

          else if ( result == 'Edit'){
            edit();
          }


        },
        itemBuilder: (context) {
          return [
            PopupMenuItem<String>(
              value: 'Edit',
              child: Row(
                children: [
                  Icon(Icons.edit,
                      color: Colors.black),
                  SizedBox(width:5),
                  Text('Modifier'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Delete',
              child: Row(
                children: [
                  Icon(Icons.delete_forever,
                      color: Colors.black),
                  Text('Supprimer'),
                ],
              ),
            ),

          ];

        },)
    ],
  ),

);
Widget CategorieItem2 ({
  required String nameUser,
  required String nameProduct,
  required int rate,
  required Function pressed,
  required Function delete,
  required Function edit,

})=>Container(

  width: double.infinity,
  height: 180,
  padding: EdgeInsetsDirectional.all(20),
  margin: EdgeInsetsDirectional.all(20),
  decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(20),

      border: Border.all(

          color: Colors.grey.withOpacity(0.5),

          width: 2

      ),

      color: Colors.white,

      boxShadow: [

        BoxShadow(

          color: Colors.grey.withOpacity(0.5),

          spreadRadius: 1,

          blurRadius: 2,

          offset: Offset(0, 1),



        ),

      ]

  ),


  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text('le Rate :   ${rate.toString()}',style: TextStyle(

              color: Colors.grey,

              fontWeight: FontWeight.bold,

              fontSize: 30,


            ),),


            Column(
              children: [
                Row(
                  children: [
                    Text('Ecrire par : ',style: TextStyle(

                      color: Colors.blue,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),
                      maxLines: 1,),
                    Text('${nameUser}',style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),
                      maxLines: 1,),
                  ],
                ),
                SizedBox(width: 50,),
                Row(
                  children: [
                    Text('le Produit : ',style: TextStyle(

                      color: Colors.blue,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),),
                    Text('${nameProduct}',style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                      fontSize: 30,


                    ),),
                  ],
                ),
              ],
            ),




          ],



        ),
      ),
      PopupMenuButton(
        onSelected: (String result){
          if (result == 'Delete' ){
            delete();
          }

          else if ( result == 'Edit'){
            edit();
          }


        },
        itemBuilder: (context) {
          return [
            PopupMenuItem<String>(
              value: 'Edit',
              child: Row(
                children: [
                  Icon(Icons.edit,
                      color: Colors.black),
                  SizedBox(width:5),
                  Text('Modifier'),
                ],
              ),
            ),
            PopupMenuItem<String>(
              value: 'Delete',
              child: Row(
                children: [
                  Icon(Icons.delete_forever,
                      color: Colors.black),
                  Text('Supprimer'),
                ],
              ),
            ),

          ];

        },)
    ],
  ),

);



Widget CategorieItemEmp ({
  required String name,
  required String image,
  required Color color,
  required Function pressed,

})=>Container(

  width: double.infinity,
  height: 180,

  decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(20),

      border: Border.all(

          color: Colors.grey.withOpacity(0.5),

          width: 2

      ),

      color: color,

      boxShadow: [

        BoxShadow(

          color: Colors.grey.withOpacity(0.5),

          spreadRadius: 1,

          blurRadius: 2,

          offset: Offset(0, 1),



        ),

      ]

  ),


  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: MaterialButton(
          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 15),



          onPressed: (){
            pressed();

          },
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [


              Text(name,style: TextStyle(

                color: Colors.white,

                fontWeight: FontWeight.bold,

                fontSize: 30,


              ),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    child: Image.network(image ,
                      fit: BoxFit.cover,
                      width: 180,
                      height: 110,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ],
              ),

            ],



          ),



        ),
      ),

    ],
  ),

);

Widget ProductListItem(
    {
      required QueryDocumentSnapshot<Object?> document,
      required Function Update,
    }
    )=>
    Container(
      height: 140,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),

      child: MaterialButton(
        onPressed: (){
          Update();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                width: 140,
                height: 140,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: ClipRRect(

                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(document['imageUrl'],
                    height: 120,
                    width: 140,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text('${document['name']}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("${document['description']}",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,



                    ),

                    ),

// Text("product.description.toString().characters.take(50)...",style: TextStyle(
// color: Colors.blueGrey,
// fontSize: 15,
// ),
// ),



                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                color: mainColor,
                size: 30,)

            ],
          ),
        ),
      ),
    );


Widget ProductListItemEmp(
    {
      required QueryDocumentSnapshot<Object?> document,
      required TextEditingController contoller,
      required Function plus,
      required Function minus,
      required Function longPlus,
      required Function longMinus,
      required Function plusEnd,
      required Function minusEnd,
      required Function validator,

    }
    )=>
    Container(
      height: 140,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              width: 140,
              height: 140,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(15),
                child: Image.network(document['imageUrl'],
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: 10,),

            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text('${document['name']}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("${document['description']}",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,



                    ),

                    ),

// Text("product.description.toString().characters.take(50)...",style: TextStyle(
// color: Colors.blueGrey,
// fontSize: 15,
// ),
// ),



                  ],
                ),
              ),
            ),
            Container(
              width: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: GestureDetector(
                      onLongPress: (){
                        longPlus();
                      },
                      onLongPressEnd: (_){
                        plusEnd();
                      },
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),


                        backgroundColor: Colors.grey.withOpacity(0.5),
                        onPressed: (){
                          plus();
                        },

                        child: Icon(Icons.add,
                            size: 22),),
                    ),
                  ),





                  SizedBox(
                    height: 35,
                    width: 60,
                    child: TextFormField(

                      controller: contoller ,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],


                      validator: (String? value){
                        return validator(value);

                      },

                      style: TextStyle(fontSize: 18.0, color: Colors.black,
                        fontWeight: FontWeight.w600,


                      ),

                      cursorColor: mainColor ,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: mainColor,
                              width: 2
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),




                      ),
                    ),
                  ),




                  SizedBox(
                    height: 35,
                    width: 35,
                    child: GestureDetector(
                      onLongPress: (){
                        longMinus();
                      },
                      onLongPressEnd: (_){
                        minusEnd();
                      },
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),


                        backgroundColor: Colors.grey.withOpacity(0.5),
                        onPressed: (){
                          minus();
                        },

                        child: Icon(Icons.remove,
                            size: 22),),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );






Widget ProductProductionListItemEmp(
    {
      required Map<String, dynamic> document,
      required TextEditingController contoller,
      required Function plus,
      required Function minus,
      required Function longPlus,
      required Function longMinus,
      required Function plusEnd,
      required Function minusEnd,
      required Function validator,
      required Function check,
      required bool checked ,
      required Function cancelCheck,

    }
    )=>
    Container(
      height: 140,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              width: 140,
              height: 140,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(15),
                child: Image.network(document['imageUrl'],
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: 10,),

            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text('${document['name']}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("${document['description']}",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,



                    ),

                    ),

// Text("product.description.toString().characters.take(50)...",style: TextStyle(
// color: Colors.blueGrey,
// fontSize: 15,
// ),
// ),



                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:  CrossAxisAlignment.end,
              children: [
                Visibility(
                  visible: checked,
                  child: IconButton(onPressed: (){
                    cancelCheck();
                  },
                      icon: Icon(Icons.cancel_outlined)),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.grey,
                          width: 1
                      )
                  ),
                  width: 110,
                  child:checked == false ?
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(greenColor),
                        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.4))
                    ),
                    onPressed: (){
                      check();
                    },
                    child: Text('Ajouter'),
                  )
                      :

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height:30,
                        width: 35,

                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                        ),

                        child: GestureDetector(
                          onLongPress: (){
                            longMinus();
                          },
                          onLongPressEnd: (_){
                            minusEnd();
                          },
                          child: TextButton(
                            child: Icon(Icons.remove,
                                color: Colors.white,
                                size: 18),
                            onPressed: (){
                              minus();
                            },
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 30,
                        width: 35,
                        child: TextFormField(


                          enableInteractiveSelection: false,

                          controller: contoller ,
                          keyboardType: TextInputType.number,
                          inputFormatters: [LengthLimitingTextInputFormatter(3)],


                          validator: (String? value){
                            return validator(value);

                          },

                          style: TextStyle(fontSize: 18.0, color: Colors.black,
                            fontWeight: FontWeight.w600,


                          ),

                          cursorColor: mainColor ,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,


                        ),
                      ),





                      Container(
                        height:30,
                        width: 35,

                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                        ),

                        child: GestureDetector(
                          onLongPress: (){
                            longPlus();
                          },
                          onLongPressEnd: (_){
                            plusEnd();
                          },
                          child: TextButton(
                            child: Icon(Icons.add,
                                color: Colors.white,
                                size: 18),
                            onPressed: (){
                              plus();
                            },
                          ),
                        ),
                      ),

                      // SizedBox(
                      //   height: 35,
                      //   width: 35,
                      //   child: GestureDetector(
                      //     onLongPress: (){
                      //       longPlus();
                      //     },
                      //     onLongPressEnd: (_){
                      //       plusEnd();
                      //     },
                      //     child: FloatingActionButton(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)
                      //       ),
                      //
                      //
                      //       backgroundColor: Colors.grey.withOpacity(0.5),
                      //       onPressed: (){
                      //         plus();
                      //       },
                      //
                      //       child: Icon(Icons.add,
                      //           size: 22),),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 35,
                      //   width: 60,
                      //   child: TextFormField(
                      //
                      //     controller: contoller ,
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      //
                      //
                      //     validator: (String? value){
                      //       return validator(value);
                      //
                      //     },
                      //
                      //     style: TextStyle(fontSize: 18.0, color: Colors.black,
                      //       fontWeight: FontWeight.w600,
                      //
                      //
                      //     ),
                      //
                      //     cursorColor: mainColor ,
                      //     textAlign: TextAlign.center,
                      //     textAlignVertical: TextAlignVertical.center,
                      //
                      //     decoration: InputDecoration(
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         borderSide: BorderSide(
                      //             color: mainColor,
                      //             width: 2
                      //         ),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         borderSide: BorderSide(
                      //           color: Colors.grey,
                      //           width: 2.0,
                      //         ),
                      //       ),
                      //
                      //
                      //
                      //
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 35,
                      //   width: 35,
                      //   child: GestureDetector(
                      //     onLongPress: (){
                      //       longMinus();
                      //     },
                      //     onLongPressEnd: (_){
                      //       minusEnd();
                      //     },
                      //     child: FloatingActionButton(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10)
                      //       ),
                      //
                      //
                      //       backgroundColor: Colors.grey.withOpacity(0.5),
                      //       onPressed: (){
                      //         minus();
                      //       },
                      //
                      //       child: Icon(Icons.remove,
                      //           size: 22),),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );








Widget ProductListHistorique(
    {

      required Map<String, dynamic> document,





    }
    )=>
    Container(
      height: 120,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              width: 140,
              height: 140,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(15),
                child: Image.network(document['imageUrl'],
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: 10,),

            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text('${document['name']}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("${document['description']}",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,



                    ),

                    ),






                  ],
                ),
              ),
            ),

            Container(
                padding: EdgeInsets.all(5),
                width: 40,
                height: 30,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey,
                      width: 2
                  ),
                ),
                child: Center(child: Text('${document['quantity']}')))

          ],
        ),
      ),
    );

Widget ProductProListHistorique(
    {

      required Map<String, dynamic> document,





    }
    )=>
    Container(
      height: 130,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 2
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),

            ),
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              width: 140,
              height: 140,


              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: ClipRRect(

                borderRadius: BorderRadius.circular(15),
                child: Image.network(document['imageUrl'],
                  height: 120,
                  width: 140,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            SizedBox(width: 10,),

            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Text('${document['name']}',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text("${document['description']}",style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,



                    ),
                      maxLines: 1,

                    ),
                    Spacer(),
                    Text('Par : ${document['realiserPar']}',

                      style: TextStyle(

                          color: Colors.black,

                          fontWeight: FontWeight.w600,

                          fontSize: 18

                      ),
                      maxLines: 1,),





                  ],
                ),
              ),
            ),

            Container(
                padding: EdgeInsets.all(5),
                width: 40,
                height: 30,

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.grey,
                      width: 2
                  ),
                ),
                child: Center(child: Text('${document['quantity']}')))

          ],
        ),
      ),
    );



