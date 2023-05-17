import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List _listTitle=['Edit Profile','Shipping Address','WishList','Order History','Track Order','Cards','Notifications',];
  List _listImg=[
    'lib/images/Group 188.png',
    'lib/images/Group 185.png',
    'lib/images/Group 189.png',
    'lib/images/Group 194.png',
    'lib/images/Group 196.png',
    'lib/images/Group 197.png',
    'lib/images/Group 198.png',
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
               child: Row(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8,right: 15),
                     child: CircleAvatar(
                       radius: 65,
                       backgroundImage:AssetImage('lib/images/Avatar.png'),
                     ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Mahmoud Mhassib',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                       SizedBox(height: 10),
                       Text('mhassib@gmail.com',style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.normal),),
                     ],
                   ),
                 ],
               ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _listTitle.length -1,
                  itemBuilder: (ctx,index){
                   return Container(
                      margin: EdgeInsets.only(top: 8,bottom: 4),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      //color: Colors.blue,
                      child: ListTile(
                        title: Text(_listTitle[index],style: TextStyle(fontSize: 20,color: Colors.black),),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)),
                        leading:  Container(
                          width: 50,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color:Color(0xFFC6F1DD) ,
                            image: DecorationImage(
                              image: AssetImage(_listImg[index]),
                            )
                          ),
                        ) ,
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
