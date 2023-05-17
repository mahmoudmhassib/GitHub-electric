import 'package:electricsapp/redux/reducer.dart';
import 'package:flutter/material.dart';

import '../ApiActions/product.dart';
import '../apiactions/Getmethod.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CARD extends StatefulWidget {
  String img;

  CARD({Key? key, required this.img}) : super(key: key);

  @override
  State<CARD> createState() => _CARDState();
}

class _CARDState extends State<CARD> {
  Future<List<Product>> printData() async {
    return await getMethod();
  }

  @override
  Widget build(BuildContext context) {
    print(printData());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon:Icon(Icons.arrow_back_outlined)),
        title: Text('Cart'),
      ),
      body: StoreConnector<List<CartItem>, List<CartItem>>(
        converter: (store) => store.state,
        builder: (context, list) {
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index].image;
              return Dismissible(
                key: Key(item),
                onDismissed: (DismissDirection dir) {
                  setState(() {
                    list.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(dir == DismissDirection.startToEnd
                          ? '$item favorite'
                          : '$item deleted'),
                    ),
                  );
                },
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
                            image: NetworkImage(list[index].image),
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
                                  text: '${list[index].title}\n\n',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '\$${list[index].price}',
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
                background: Container(
                  color: Colors.lime,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 50,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Favorite',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        size: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      /*body:
     */
      /* SafeArea(
        child: Stack(children: [
          FutureBuilder<List<Product>>(
            future: getMethod(),
            builder: (ctx, snapShot) {
              if(snapShot.hasData){
                return ListView.builder(
                itemCount: snapShot.data!.length,
                itemBuilder: (ctx, index) {
                  final item = snapShot.data![index].image;
                  return Dismissible(
                    key: Key(item),
                    onDismissed: (DismissDirection dir) {
                      setState(() {
                        snapShot.data!.removeAt(index);
                      });
                      ScaffoldMessenger.of(ctx).showSnackBar(
                        SnackBar(
                          content: Text(dir == DismissDirection.startToEnd
                              ? '$item favorite'
                              : '$item deleted'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              setState(() {
                                snapShot.data!
                                    .insert(index, snapShot.data![index]);
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 13, right: 13, left: 13, bottom: 5),
                      child: CartCard(
                        img: snapShot.data![index].image!,
                        tit: snapShot.data![index].title!,
                        price: snapShot.data![index].price!,
                      ),
                    ),
                    background: Container(
                      color: Colors.lime,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 50,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Favorite',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            size: 50,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Delete',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
              }else if(snapShot.hasError){
                 return Text(snapShot.error.toString());
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Text(
                        '\$${4500}',
                        style: TextStyle(
                            color: Color(0xFF00C569),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(width: 30),
                  Container(
                    width: 180,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFF00C569),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'checkout'.toUpperCase(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),*/
    );
  }
}

class CartCard extends StatefulWidget {
  String img;
  String tit;
  num price;

  CartCard(
      {Key? key, required this.img, required this.tit, required this.price})
      : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int counter = 0;

  increment() {
    setState(() {
      counter++;
    });
  }

  decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    } else {
      setState(() {
        counter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(widget.img),
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
                    text: '${widget.tit}\n\n',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: '\$${widget.price}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF00C569),
                        fontWeight: FontWeight.normal),
                  ),
                ]),
              ),
              SizedBox(height: 15),
              Container(
                width: 110,
                height: 35,
                color: Colors.grey,
                child: Row(
                  children: [
                    IconButton(onPressed: increment, icon: Icon(Icons.add)),
                    Text('$counter'),
                    IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
