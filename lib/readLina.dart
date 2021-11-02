import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
  String dirPath='';
  String savePath='';
  int record=0;
  String line='';
  String readLinex='';
  List<String> list35=[];

  Future writeDownload() async {
    Response response = await dio.get('https://www.w3.org/TR/PNG/iso_8859-1.txt',
      //Response response = await dio.get('https://www.w3.org/People/mimasa/test/imgformat/img/w3c_home.jpg',
      //onReceiveProgress: showDownloadProgress,
      //Received data with List<int>
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    Directory? directory= await getExternalStorageDirectory();
    dirPath=directory!.path;
    savePath='$dirPath/Denemetxt.txt';
    File file=File(savePath);
    var raf=file.openSync(mode: FileMode.write);
    //response.data is List<int>
    raf.writeFromSync(response.data);
    await raf.close();
    print('kayit yapildi');
  }

  Future readDownload1() async {
    Directory? directory= await getExternalStorageDirectory();
    dirPath=directory!.path;
    savePath='$dirPath/Denemetxt.txt';
    File file=File(savePath);
    var raf=file.openSync(mode: FileMode.read);
    //final contentx=await raf.readAsStringSync();
    //final contentx=await raf.read(2000);
    final contentx=await raf.readSync(100);
    raf.close();
    print('Dosya Okundu');
    print(contentx.length);
    print(contentx);
  }

  Future<List<String>> readDownload() async {
    List<String> list=[];
    Directory? directory= await getExternalStorageDirectory();
    dirPath=directory!.path;
    savePath='$dirPath/Denemetxt.txt';
    File file=File(savePath);
    var raf=file.openSync(mode: FileMode.read);
    //final contentx=await file.readAsStringSync();
    //final contentx=await file.readAsLinesSync().first;
    record=await file.readAsLinesSync().length;  // 104
    //final contentx=await file.readAsLinesSync().elementAt(0);
    for(int i=0; i<record; i++){
      final contentx=await file.readAsLinesSync().elementAt(i);
      setState(() {
        line=contentx.toString();
      });
      print(contentx);
      list.add(contentx);
      print(list.length);
    }
    raf.closeSync();
    print('Dosya Okundu');
    //print(contentx);
    return list;
  }

  Future pathx() async{
    Directory? directory= await getExternalStorageDirectory();
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




  @override
  void initState() {
    super.initState();
    //readDownload();
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
                Text(record.toString()),
                ElevatedButton(
                    onPressed: () async{
                      list35=await readDownload();
                      print(list35.length);
                      print('API Test');
                      readLinex=list35.first;
                    },
                    child: Text("API Test")
                ),
                Text(list35.length.toString()),
                Expanded(
                  child: ListView.builder(
                      itemCount:list35.length ,
                      itemBuilder: (BuildContext context,int index){
                        readLinex=list35[index].toString();
                        return ListTile(
                          title: Card(child: Text(readLinex)),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
