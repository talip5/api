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

  Future filex() async {
    //final response = await dio.get('https://google.com');
    final response = await dio.get('https://api.frankfurter.app'); //{"docs":"https://www.frankfurter.app/docs"}
    //response = await dio.download('https://www.google.com/', './xx.html');
    //response = await dio.download("storage/emulated/0/Android/data/com.example.directory/files/", './counter.txt');
    //response = await dio.download("c:\\test\\", './myfile.txt');
    //print(response.toString());
    //print(response.data);
    print(response.toString());
  }

  Future filexMap() async {
    List<String> currencies = [];
    Response response = await dio.get(
        'https://api.frankfurter.app'); //{"docs":"https://www.frankfurter.app/docs"}
    if (response.statusCode == 200) {
      // print(response.runtimeType); //Response<dynamic>
      // print(response.statusMessage); //OK
      // print(response.data); //{docs: https://www.frankfurter.app/docs}
      // print(response); //{"docs":"https://www.frankfurter.app/docs"}
      // print(response.realUri); //https://api.frankfurter.app
      // print(response.toString()); //{"docs":"https://www.frankfurter.app/docs"}
      // print(response.data.toString()); //{docs: https://www.frankfurter.app/docs}
     // print(response.headers); // connection: keep-alive
      //print(response.extra.keys.last);
      //print(response.extra.length);
      // print(response.data as Map);
      var result=response.data as Map;
      // print(result.length);  // 1
      // print(result.isEmpty);  //false
      // print(result.keys.first); //docs
      // print(result.values.first);  // https://www.frankfurter.app/docs
      result.forEach((key, value) {
        print(key+'    '+value);
        currencies.add(key);
        print(currencies.length);
        String key35=key.toString();
        currencies.add(key35);
        print(currencies.length);
        currencies.add('value');
        print(currencies.length);
      });
      /*(response.data as Map).forEach((key, value) {
        print(key);
        //currencies.add(key);
      });*/
      //print(response.toString());
      // print(response.data);
    }
  }

  @override
  void initState() {
    super.initState();
    filexMap();
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
