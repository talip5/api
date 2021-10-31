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
    //final response = await dio.get('https://google.com');
    final response = await dio.get(
        'https://api.frankfurter.app'); //{"docs":"https://www.frankfurter.app/docs"}
    //response = await dio.download('https://www.google.com/', './xx.html');
    //response = await dio.download("storage/emulated/0/Android/data/com.example.directory/files/", './counter.txt');
    //response = await dio.download("c:\\test\\", './myfile.txt');
    //print(response.toString());
    //print(response.data);
    print(response.toString());
  }

  Future filexMap() async {
    List<String> currencies = [];
    //Response response = await dio.get("https://api.frankfurter.app"); //{"docs":"https://www.frankfurter.app/docs"}
    Response response = await dio.get("https://jsonplaceholder.typicode.com/todos/1");
    if (response.statusCode == 200) {
    print(response.statusMessage);
    print(response.data);
    (response.data as Map).forEach((key, value) {
     // print(key+'  '+value.runtimeType.toString());
      if(key=='id'){
        print(value);
      }
    });
    }
  }

  Future fileyMap() async {
    List<dynamic> currencies = [];
    //Response response = await dio.get("https://api.frankfurter.app"); //{"docs":"https://www.frankfurter.app/docs"}
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
    if (response.statusCode == 200) {
      print(response.statusMessage);
      //print(response.data);
      (response.data as Map).forEach((key, value) {
        print(key);
        if(value is int){
          print(value.toString());
          currencies.add(value);
        }
        else if(value is String){
          print(value);
          currencies.add(value);
        }
      });
      print(currencies.length);
      //print(currencies.last);
      print(currencies.elementAt(2));
    }
  }

  Future filezMap() async {
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
      (list.elementAt(0) as Map).forEach((key, value) {
        if(value is int) {
          print(key.toString() + '  ' + value.toString());
        }else if(value is String){
          print(key+'  '+value);
        }
      });
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
    filewMap();
    /*BaseOptions options = BaseOptions();
    options.baseUrl = 'https://api.frankfurter.app/';
    dio = new Dio(options);*/
    //getCurrencies();
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
