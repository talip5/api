import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

    print(response.toString());
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
                      filexMap();
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
