import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

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

  Future writeDownload() async {
    Response response = await dio.get('https://www.w3.org/TR/PNG/iso_8859-1.txt',
      //Response response = await dio.get('https://www.w3.org/People/mimasa/test/imgformat/img/w3c_home.jpg',
      //onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          }),
    );
    Directory directory= await getExternalStorageDirectory();
    dirPath=directory.path;
    savePath='$dirPath/Denemetxt.txt';
    File file=File(savePath);
    var raf=file.openSync(mode: FileMode.write);
    //response.data is List<int>
    raf.writeFromSync(response.data);
    await raf.close();
    print('kayit yapildi');
  }

  Future pathx() async{
    Directory directory= await getExternalStorageDirectory();
    print(directory);
  }

  Future filex() async {
    Response response = await dio.get('https://www.w3.org/TR/PNG/iso_8859-1.txt');
    if(response.statusCode==200) {
      //print(response.data);
      print(response.statusMessage);
      var text=response.data as String;
      //print(text);
      // var newString=text.substring(text.length-1400);
      //var newString=text.substring(1000);
      // print(newString);
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
    pathx();
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
