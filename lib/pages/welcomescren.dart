import 'package:electricsapp/apiactions/Getmethod.dart';
import 'package:flutter/material.dart';
import '../tabScreen.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _emailControl=TextEditingController();
  final _passControl=TextEditingController();
  bool PASSVISIBLE=true;

  void _onTap() async{
    var res = postSignIn( _emailControl.text, _passControl.text);
print('33333333333');
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> TabScreen()));
    if(await res == "exist"){
      print('not ok');
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> TabScreen()));
      print('5555555555');
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 370,
                margin: EdgeInsets.all(20),
                child: PhysicalModel(
                  color:Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 15,
                  borderRadius: BorderRadius.circular(5),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                           children: [
                             buildText('Welcome,',30,Colors.black,FontWeight.bold),
                             SizedBox(height: 8),
                             buildText('Sign in to Continue,',15,Colors.grey,FontWeight.normal),
                           ],
                            ),
                            buildText('Sign',20,Color(0xFF00C569),FontWeight.normal),
                          ],
                        ),
                        SizedBox(height: 20),
                        buildTextFieldEmail(_emailControl),
                        SizedBox(height: 15),
                        buildTextFieldPass(_passControl),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Align(alignment: Alignment.centerRight,child: buildText('Forget Password?',15,Colors.black54,FontWeight.normal)),
                        ),
                        SizedBox(height: 10),
                        buildContainerButton(_onTap),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 15),
                child: Align(alignment: Alignment.center,child: Text('-OR-',style: TextStyle(fontSize: 20),)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 15),
                child: buildContainerFacebook('Sign In with Facebook',Icons.facebook),
              ),
              buildContainerFacebook('Sign In with Google',Icons.facebook),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerFacebook(String text,IconData iconData) {
    return Container(
              padding: EdgeInsets.only(left: 30),
              width: 380,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.grey,width: .5)
              ),
              child: Center(
                child: Row(

                  children: [
                    Icon(iconData),
                    SizedBox(width: 65),
                    Text(text,style: TextStyle(fontSize: 15),)

                  ],
                ),
              ),
            );
  }

  Text buildText(String text,double font,Color col,FontWeight fontWeight) {
    return Text(text,style: TextStyle(fontSize: font,color: col,fontWeight: fontWeight),);
  }

  Container buildContainerButton(Function()? onTap) {
    return Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                          color:Color(0xFF00C569),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: GestureDetector(
                              onTap:onTap,
                              child: Text('sign in'.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 18),)),
                        ),
                      );
  }

  TextField buildTextFieldPass(dynamic _control) {
    return TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _control,
                      obscureText: PASSVISIBLE,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              PASSVISIBLE=!PASSVISIBLE;
                            });
                          },
                          icon: PASSVISIBLE?Icon(Icons.visibility_off_sharp,color: Colors.grey,):Icon(Icons.visibility,color: Colors.grey,),
                        ),
                        hintText: 'Password',
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF00C569)),
                        ),
                      ),
                    );
  }

  TextField buildTextFieldEmail(dynamic _control) {
    return TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _control,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                       labelStyle: TextStyle(
                         color: Colors.grey
                       ),
                       focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF00C569))),
                      ),
                    );
  }
}
