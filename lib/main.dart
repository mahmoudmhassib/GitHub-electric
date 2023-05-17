import 'package:electricsapp/pages/verify.dart';
import 'package:electricsapp/pages/welcomescren.dart';
import 'package:electricsapp/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'apiactions/Getmethod.dart';
main() {
  final store = Store<List<CartItem>>(cartReducer, initialState: <CartItem>[]);
  runApp(MyApp(store: store));
}


class MyApp extends StatelessWidget {
  final Store<List<CartItem>> store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final usernameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool passvisible=true;
  void _ONTAP(){
    postSignUp(
      usernameController.text,
      emailController.text,
      passwordController.text,
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>WelcomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildContainer(),
              Container(
                height: 480,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                ),
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 15,
                  shadowColor: Colors.grey,
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Sign Up',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),

                        buildTextField('Name','Name',TextInputType.text,usernameController),
                        buildTextField('E-mail','E-mail',TextInputType.emailAddress,emailController),
                        buildTextFieldPassword(passwordController),

                        buildGestureDetector(_ONTAP),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextFieldPassword(dynamic _controller) {
    return TextField(
                     style: TextStyle(fontSize: 25,color: Colors.black),
                     keyboardType: TextInputType.visiblePassword,
                     controller: _controller,
                     obscureText: passvisible,
                     decoration: InputDecoration(
                         focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFF00C569),width: 1 )),
                         suffixIcon: IconButton(
                         icon: passvisible?Icon(Icons.visibility_off_sharp,color: Colors.grey,):Icon(Icons.visibility,color: Colors.grey,),
                         onPressed: (){
                           setState(() {
                             passvisible=!passvisible;
                           });
                         },
                       ),
                         hintText: 'Password',
                         labelText: 'Password',
                         labelStyle:const TextStyle(color: Colors.grey,fontSize: 22),
                         enabledBorder:const UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFF00C569),width: 1.5 ))
                     ),);
  }

  TextField buildTextField(String hint,String label,TextInputType inputType,dynamic _controller) {
    return TextField(
                        style: TextStyle(fontSize: 25,color: Colors.black),
                        keyboardType: inputType,
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: hint,
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFF00C569),width: 1 )),
                          labelStyle:const TextStyle(color: Colors.grey,fontSize: 22),
                          enabledBorder:const UnderlineInputBorder(borderSide: BorderSide(color:Color(0xFF00C569),width: 1.5 ))
                        ),

                      );
  }

  GestureDetector buildGestureDetector(Function()? onTap) {
    return GestureDetector(
                    onTap: onTap,
                    child: Container(
                      margin: EdgeInsets.only(left: 24),
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF00C569),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('sign up'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 15),),
                      ),
                    ),
                  );
  }

  Container buildContainer() {
    return Container(
            padding: EdgeInsets.only(left: 10),
            height: 100,
            //child: Icon(Icons.arrow_back_ios_new),
          );
  }
}

