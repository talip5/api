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
  String dirPath = '';
  String savePath = '';
  String savePathCopy = '';
  int record = 0;
  String line = '';
  String readLinex = '';
  List<String> list35 = [];

  Future<List<String>> readDownload() async {
    List<String> list = [];
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePath = '$dirPath/Denemetxt.txt';
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.read);
    //final contentx=await file.readAsStringSync();
    //final contentx=await file.readAsLinesSync().first;
    record = await file.readAsLinesSync().length; // 104
    //final contentx=await file.readAsLinesSync().elementAt(0);
    for (int i = 0; i < record; i++) {
      final contentx = await file.readAsLinesSync().elementAt(i);
      setState(() {
        line = contentx.toString();
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

  Future writeLine() async {
    List<String> list = [];
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePath = '$dirPath/Denemetxt.txt';
    savePathCopy = '$dirPath/DenemetxtCopy.txt';
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.read);
    record = await file.readAsLinesSync().length; // 104
    //final contentx = await file.readAsLinesSync().elementAt(0);
    await file.copy(savePathCopy);
    raf.closeSync();
    print('Dosya Okundu');
    print(contentx);
  }

  @override
  void initState() {
    super.initState();
    //readDownload();
  }

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
                    onPressed: () async {
                      list35 = await readDownload();
                      print(list35.length);
                      print('ReadLine');
                      //readLinex=list35.first;
                    },
                    child: Text("ReadLine")),
                Text(list35.length.toString()),
                ElevatedButton(
                    onPressed: () async {
                      await writeLine();
                      print(list35.length);
                      print('Write Line');
                      //readLinex=list35.first;
                    },
                    child: Text("Write Line")),
                Expanded(
                  child: ListView.builder(
                      itemCount: list35.length,
                      itemBuilder: (BuildContext context, int index) {
                        readLinex = list35[index].toString();
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
