import 'package:electricsapp/pages/welcomescren.dart';
import 'package:flutter/material.dart';
class Verfy extends StatefulWidget {
  const Verfy({Key? key}) : super(key: key);

  @override
  State<Verfy> createState() => _VerfyState();
}

class _VerfyState extends State<Verfy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildContainerIcon(),
              Container(
                margin: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  shadowColor: Colors.grey,
                  elevation: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Verification',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                        SizedBox(height: 8),
                        Text('A 6 - Digit PIN has been sent to your email\naddress , enter it below to continue',
                          style: TextStyle(fontSize: 15,color: Colors.grey),),
                        SizedBox(height: 8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildSizedBox(),
                                buildSizedBox(),
                                buildSizedBox(),
                                buildSizedBox(),
                                buildSizedBox(),
                                buildSizedBox(),
                              ],
                            ),
                          ),
                        ),
                        buildContainerButton(),
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

  Container buildContainerIcon() {
    return Container(
              padding: EdgeInsets.only(left: 15),
              height: 100,
              child: Icon(Icons.arrow_back_ios),
            );
  }

  Container buildContainerButton() {
    return Container(
                        margin: EdgeInsets.only(left: 13),
                        width: 330,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF00C569),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>WelcomeScreen()));
                          },
                          child: Center(
                            child: Text('continue'.toUpperCase(),style: TextStyle(fontSize: 20,color: Colors.white),),
                          ),
                        ),
                      );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
                                height: 40,
                                width: 35,
                                child: TextField(
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    counterText: '',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onChanged: (value){
                                    if(value.length==1){
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                ),
                              );
  }
}
