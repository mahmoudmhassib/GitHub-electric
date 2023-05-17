import 'package:electricsapp/ApiActions/product.dart';
import 'package:flutter/material.dart';

import '../apiactions/Getmethod.dart';
import 'itemDetails.dart';
class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Items '),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Product>>(
          future: getMethod(),
          builder: (ctx,snapShot){
            if(snapShot.hasData){
              return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (BuildContext ctx,int index){
                  return
                    GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ItemDetails(id: snapShot.data![index].id,)));},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                       // color: Colors.white,
                        child: PhysicalModel(
                          shadowColor: Colors.grey,
                          color: Colors.white,
                          elevation: 20,
                          borderRadius: BorderRadius.circular(8),
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapShot.data![index].image),
                                    )),
                              ),
                              SizedBox(width: 28),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: '${snapShot.data![index].title}\n\n',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.normal,

                                        ),
                                      ),
                                      TextSpan(
                                        text: '\$${snapShot.data![index].price}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFF00C569),
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                },
              );
            } else if(snapShot.hasError){
              return CircularProgressIndicator();
            } else {
              return Text("ldjg");
            }
          },
        ),
      ),
    );
  }
}
