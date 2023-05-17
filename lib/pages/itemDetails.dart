import 'package:electricsapp/ApiActions/product.dart';
import 'package:electricsapp/apiactions/Getmethod.dart';
import 'package:electricsapp/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
class ItemDetails extends StatefulWidget {
  int id;
   ItemDetails({Key? key,required this.id}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: FutureBuilder<Product>(
            future: getById(widget.id),
            builder: (ctx,snapShot){
              return   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildContainerFirst(context,snapShot.data!.image),
                  Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 10,left: 15),
                          child: Text(snapShot.data!.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black))
                      ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildContainerSecond('Size','XL'),
                        Container(
                          width: 170,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Color',style: TextStyle(fontSize: 25),),
                                SizedBox(width: 20),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15,left: 15,bottom: 10),
                      child:  Text('Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,left: 15),
                    child: buildPaddingText(snapShot.data!.details,16,FontWeight.normal,Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(text: 'PRICE\n',style: TextStyle(color: Colors.grey,fontSize: 20)),
                                    TextSpan(text: '\$${snapShot.data!.price}',style: TextStyle(color: Color(0xFF00C569),fontSize: 25,fontWeight: FontWeight.bold)),
                                  ]
                              ),),
                        SizedBox(width: 50),
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF00C569),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: StoreConnector<List<CartItem>, VoidCallback>(
                              converter: (store) {
                                return () {
                                  store.dispatch(AddToCartAction(
                                      CartItem(
                                        snapShot.data!.id,
                                        snapShot.data!.title,
                                        snapShot.data!.price,
                                        snapShot.data!.image,
                                      )));
                                  print('done!!');
                                };
                              },
                              builder: (context, callback) {
                                return TextButton(onPressed: callback, child: Text('Add'));
                              },
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ) ;
            },
            ),
        ) ,
      ),
    );
  }

  Text buildPaddingText(String title,double x,FontWeight fontWeight,Color col) {
    return  Text(title,style: TextStyle(fontSize: x,fontWeight: fontWeight,color: col));

  }

  Container buildContainerSecond(String text1,String text2) {
    return Container(
                width: 170,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(text1,style: TextStyle(fontSize: 20),),
                      SizedBox(width: 20),
                      Text('XL',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              );
  }

  Stack buildContainerFirst(BuildContext context,String img) {
    return Stack(
      children: [
    Container(
    width: MediaQuery.of(context).size.width,
    height: 300,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage(img),
      fit: BoxFit.fill,
    ),

    ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 60),
              child: IconButton(onPressed: (){Navigator.of(context).pop();},icon: Icon(Icons.arrow_back_ios_new_rounded)),
            ),

            Padding(
              padding:  const EdgeInsets.only(right: 15,top: 60),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child:Icon(Icons.star_border) ,
                ),
              ),
            ),
          ],
        ),
      ]
    );
  }
}
