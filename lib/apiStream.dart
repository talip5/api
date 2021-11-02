import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dio = Dio();
  bool isLoading = true;
  var selectedCurrency;
  int index=0;

  Future filex() async {
    Response response = await dio.get('https://www.w3.org/TR/PNG/iso_8859-1.txt');
    if(response.statusCode==200) {
      // print(response.data);
      //String text=response.data as String;
      var text=Converter;
      print(text.length);
      var copyx=text.characters.iteratorAtEnd.copy();
      //print(text);
      //print(text.contains('XXXX'));
      //print(text.contains('\n'));
      //print(text.split('\n'));
      //print(text.toString());
      //print(copyx.isEmpty);
      // print(text.indexOf('2E',));  // 1016
      //  print(text.codeUnitAt(0).bitLength);
      //  print(text.codeUnitAt(6117));
      //  List list=text.codeUnits;
      //  print(list.length);
      //print(list.elementAt(1016));
      // print(text.codeUnitAt(1013).toString());
    }
  }


  Future filewMap() async {
    List<dynamic> currencies = [];
    //Response response = await dio.get("https://api.frankfurter.app"); //{"docs":"https://www.frankfurter.app/docs"}
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/1/comments');
    if (response.statusCode == 200) {
      print(response.statusMessage);
      //print(response.runtimeType);
      //print((response.data as List).first);
      //print((response.data as List).last);
      List list=response.data as List;
      print(list.length);
      //print(list.elementAt(0));
      for(int i=0; i<list.length; i++){
        (list.elementAt(i) as Map).forEach((key, value) {
          print('$key   $value');
        });}
    }
  }

  @override
  void initState() {
    super.initState();
    filex();
  }

  List<String> currencies = [];

  /*Future<List> getCurrencies()async{
    setState(() {
      isLoading;
    });
    Response result=await dio.get("currencies");
    if(result.statusCode==200){
      (result.data as Map).forEach((key,value){
        currencies.add(key);
      });
    }
    setState((){
      bool isLoading = false;
    });
    }
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'download',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text('Currency API')),
          body: Center(
            child: Column(
              children: [
                Text('API35'),
                ElevatedButton(
                    onPressed: () {

                      print('API Test');
                    },
                    child: Text("API Test")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
