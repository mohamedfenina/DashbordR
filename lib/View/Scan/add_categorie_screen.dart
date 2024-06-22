import 'dart:io';





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../components.dart';
import '../../constants/responsive.dart';
import '../../widgets/contract_bottom_sheet.dart';
import '../RateComponnent.dart';
import '../drawer_menu.dart';
import 'Categorie.dart';



class AddRate extends StatefulWidget {
  const AddRate({Key? key, this.type, this.documentId}) : super(key: key);
  final String? type;
  final String? documentId;



  @override
  State<AddRate> createState() => _AddRateState();
}

class _AddRateState extends State<AddRate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ProductController = TextEditingController();
  TextEditingController Commentaire = TextEditingController();


  CategorieProduction _categorie = CategorieProduction();
  int rate = 1 ;
  var formKey = GlobalKey<FormState>();

  List<String> colors = ['Verte','Bleu','Violet','Orange','Rose','Grise'];
  String? selectedValue ;
  bool imageError = false;
  bool loading = false;
  String productId = '';

  void initState() {
    super.initState();
    if (widget.type == 'update') {
      _categorie.getDataById(widget.documentId!).then((document) {
        if (document != null) {
          ProductController.text = document['product'];
          productId = document['productId'];
          setState(() {
            rate = document['rate'];
          });


        } else {
          // Document doesn't exist
          print('Document not found.');
        }
      });



    }
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerMenu(),
      body: Row(
        children: [
          if (Responsive.isDesktop(context))
            Expanded(child: DrawerMenu(),),
          Expanded(
            flex: 5,
            child: Form(
              key:  formKey ,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: mainColor,
                      child: Center(
                        child: Text('${widget.type == 'update' ? 'Modifier Category' : 'Ajouter Category' }',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),
                        ),
                      ),),
                    Padding(
                      padding: const EdgeInsets.only(left: 150,right: 150),
                      child: Column(
                        children: [





                          SizedBox(height: 20),
                          defaultFormField(
                              readonly: true,

                              tab: (){
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  enableDrag: false,
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      topRight: Radius.circular(16.0),
                                    ),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return FractionallySizedBox(
                                        heightFactor: 0.7,
                                        child: ContractBottomSheet());
                                  },
                                ).then((value) {
                                  if(value != null){
                                    ProductController.text = value[1];
                                    productId = value[0].toString();

                                  }
                                });
                              },
                              contoller: ProductController,
                              type: TextInputType.text,
                              validate: (value){
                                if(value.isEmpty){
                                  return'le nom est manquant ';
                                }
                              },
                              label: 'Select Product Name',
                              prefix: Icons.propane_tank_rounded
                          ),
                          SizedBox(height: 20),
                          RateComponent(
                            rate: rate,
                            check: (value){
                              rate = value + 1;
                            },

                          ),
                          SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [


                              SizedBox(width:10 ,),
                              AddButton(
                                  color: greenColor,
                                  pressed: () async {
                                    if(!loading){
                                      if( widget.type != 'update'){
                                        if (formKey.currentState!.validate()) {
                                          setState(() {
                                            loading = true;

                                            imageError = false;
                                          });
                                          await _categorie.SetRate(
                                              context,
                                              productId,
                                              rate
                                          );
                                          Navigator.pop(context);

                                        }
                                        else{

                                        }



                                      }
                                      else{
                                        if (formKey.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('Modification'),
                                              content: Text('Êtes-vous sûr de vouloir modifier ce employé ?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: Text('Non'),
                                                ),
                                                TextButton(
                                                  onPressed: loading ? null :() async {
                                                    setState(() {
                                                      loading =true;
                                                    });


                                                    await _categorie.putRate(
                                                      context,
                                                      widget.documentId!,
                                                      ProductController.text,
                                                      rate,



                                                    );
                                                    Navigator.of(context).pop(true);
                                                  },
                                                  child:Text('Oui'),
                                                ),
                                              ],
                                            ),
                                          ).then((value) {
                                            // If the user confirmed, close the app
                                            if (value == true) {
                                              Navigator.pop(context,true);
                                            }
                                          });
                                        }

                                      }
                                    }
                                    else
                                      null;







                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (ctx) => const ShowProviderScreen()));
                                  }, text: '${widget.type =='update' ? 'Modifier': 'Créer' }',
                                  loading: loading),
                            ],
                          )
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
    );
  }















}
