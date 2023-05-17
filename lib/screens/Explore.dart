import 'package:flutter/material.dart';

import '../pages/allproduct.dart';
import '../pages/itemDetails.dart';
class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);


  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List _listText=['Men','Women','Device','Gadgets','Games','play'];
  List _IMAGE=[
    'lib/images/explore/Path 48.png',
         'lib/images/explore/Icon_Womens Shoe.png',
         'lib/images/explore/Group 211.png',
         'lib/images/explore/Group 209.png',
        'lib/images/explore/Icon_Gaming.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35,bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                          Container(
                            width: 310,
                            height: 45,
                            margin: EdgeInsets.all(8),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.grey,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                prefixIcon: Icon(Icons.search,color: Colors.black,),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(50) ,
                                  borderSide: BorderSide(width: 1)
                                ),
                              ),
                            ),
                          ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Center(
                        child: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 30,bottom: 15,left: 20),
                 child: Align(alignment: Alignment.centerLeft,child: Text('Categories',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
               ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 126,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: _IMAGE.length ,
                    itemBuilder: (ctx,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            child:Center(child: Image.asset(_IMAGE[index]),),
                          ),
                          Text(_listText[index]),
                        ],
                      ),
                    );
                    }
                ),
              ),
              buildPaddingTitle('Best Selling','See all'),
              buildContainerBestandRecom(context),
              buildPaddingTitle('Recommended','See all'),
              buildContainerBestandRecom(context),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerBestandRecom(BuildContext context) {
    return Container(
              width: MediaQuery.of(context).size.width,
              height: 272,
             margin: EdgeInsets.only(top: 10,bottom: 0,right: 10,left: 10),
             // padding: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
              child: GridView(
                children: [
                  buildCard(context,'lib/images/bestsell/Image7.png','BeoPlay Speaker','Bang and olufsen',755),
                  buildCard(context,'lib/images/bestsell/img.png','Leather Wristwatch','Tag heuer',450),
                ],
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 275,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: 20,
                ),
              ),
            );
  }

  Padding buildPaddingTitle(String title,String txt) {
    return Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                  TextButton(
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AllProduct()));},
                      child: Text(txt,style: TextStyle(fontSize: 20),)),
                ],
              ),
            );
  }
  Container buildCard(BuildContext context,String img,String title,String subtitle,int x) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(5) ,topLeft: Radius.circular(5))
      ),
      child: Card(
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(img),
                                fit: BoxFit.cover,
                              ),
                                borderRadius: BorderRadius.only(topRight:Radius.circular(5) ,topLeft: Radius.circular(5)),
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(title),
                          subtitle: Text(subtitle),),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Align(alignment: Alignment(-.801,0),child: Text('\$${x}',style: TextStyle(color: Colors.cyan,fontSize: 20),)),
                        )
                      ],
                    ),
                  ),
    );
  }
}
