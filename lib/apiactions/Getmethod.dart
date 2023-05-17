import 'dart:convert';
import 'package:electricsapp/ApiActions/product.dart';
import 'package:http/http.dart' as http;
Future<List<Product>> getMethod()async{
  const URL='https://flutter-store.onrender.com/product/recommended';
  final response=await http.get(Uri.parse(URL));
  if(response.statusCode==200){
   List jsondecode = json.decode(response.body);
   return jsondecode.map((item) {
     return Product.fromJson(item);
   }).toList();
  }else{
    throw Exception('there is error in get method');
  }
}

Future<Product> getById(int id)async{
  final _URL='https://flutter-store.onrender.com/product/recommended/$id';
  final response=await http.get(Uri.parse(_URL));
  if(response.statusCode==200){
    Map<String,dynamic> jsdecode=json.decode(response.body);
    return Product.fromJson(jsdecode);
  }else{
    throw Exception('error in get one item');
  }
}


Future<String> postSignUp(String username,String email,String password )async{
  final _URL='https://flutter-store.onrender.com/user/add-user';
  final res=await http.post(
    Uri.parse(_URL),
    headers:<String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: jsonEncode(<String,dynamic>{
      'username':username,
      'email':email,
      'password':password,
    }),
  );
  if(res.statusCode==200){
    return res.body;
  }else{
    throw Exception('error in post');
  }
}

Future<String> postSignIn(String email,String password )async{
  final _URL='https://flutter-store.onrender.com/user/sign-in';
  final res=await http.post(
    Uri.parse(_URL),
    headers:<String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,dynamic>{
      'email':email,
      'password':password,
    }),
  );
  if(res.statusCode==200){
    return res.body;
  }else{
    throw Exception('error in post');
  }
}
