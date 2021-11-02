import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math';

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
  int? randomNumber;

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
    //savePath = '$dirPath/Denemetxt.txt';
    savePath = '$dirPath/DenemetxtCopy1.txt';
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.read);
    record = await file.readAsLinesSync().length; // 104
    //final contentx = await file.readAsLinesSync().elementAt(0);
    raf.closeSync();
    print('Dosya Okundu');
    print(record);
  }

  Future fileCopy() async {
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePath = '$dirPath/Denemetxt.txt';
    savePathCopy = '$dirPath/DenemetxtCopy5.txt';
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.read);
    //record = await file.readAsLinesSync().length; // 104
    //final contentx = await file.readAsLinesSync().elementAt(0);
    await file.copy(savePathCopy);
    raf.closeSync();
    print('Dosya Okundu');
    //print(contentx);
  }

  Future<dynamic> fileAppend1() async {
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePath = '$dirPath/DenemetxtCopy1.txt';
    File file = File(savePath);
    var raf = file.openSync(mode: FileMode.read);
    String lineAppend='A';
    //raf.writeStringSync(lineAppend);
    //var count1=await file.length();
   //file.writeAsStringSync(lineAppend, mode:FileMode.write);
     file.writeAsString(lineAppend + '\n',
        mode: FileMode.append, flush: true);
    //record = await file.readAsLinesSync().length; // 104
    //final contentx = await file.readAsLinesSync().elementAt(0);
    raf.closeSync();
    print("Dosya'ya yazildi");
    //print(count1);
  }

  Future<dynamic> fileAppend() async {
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePath = '$dirPath/DenemetxtCopy1.txt';
    File file = File(savePath);
    //var raf = file.openSync(mode: FileMode.read);
    List letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"];
    for (int i = 0; i < 10; i++) {
      await file.writeAsString("${letters[i]}", mode: FileMode.append);
    }
    //String lineAppend='deneme3535 =========================';
    //raf.writeStringSync(lineAppend);
    //var count1=await file.length();
    //var count1=await file.readAsLinesSync().length;
    //record = await file.readAsLinesSync().length; // 104
    //final contentx = await file.readAsLinesSync().elementAt(0);
    //raf.closeSync();
    print("Dosya'ya yazildi");
    //print(count1);
  }

  Future fileCreate(String randomNumberStringx) async {
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePathCopy = '$dirPath/Deneme$randomNumberStringx.txt';
    File file = File(savePathCopy);
    //var raf = file.openSync(mode: FileMode.read);
    file.createSync();
    print('fileCreate');
    print(file.path);
  }

  Future fileDelete() async {
    Directory? directory = await getExternalStorageDirectory();
    dirPath = directory!.path;
    savePathCopy = '$dirPath/DenemetxtCopy.txt';
    File file = File(savePathCopy);
    file.deleteSync(recursive: false);
    print('$savePathCopy dosyasi silindi');
  }

  @override
  void initState() {
    super.initState();
    //readDownload();
    random35();
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
                Text(randomNumber.toString()),
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
                      //print(list35.length);
                      print('Write Line');
                      //readLinex=list35.first;
                    },
                    child: Text("Write Line")
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {});
                      var randomNumber1=random35();
                      randomNumber=randomNumber1;
                      String randomNumberString=randomNumber.toString();
                      await fileCreate(randomNumberString);
                      print('File Create');
                    },
                    child: Text("File Create")
                ),
                ElevatedButton(
                    onPressed: () async {
                      await fileCopy();
                      print('File Copy');
                    },
                    child: Text("File Copy")
                ),
                ElevatedButton(
                    onPressed: () async {
                      await fileAppend1();
                      print('File Append');
                    },
                    child: Text("File Append")
                ),
                ElevatedButton(
                    onPressed: () async {
                      await fileDelete();
                      print('File Delete');
                    },
                    child: Text("File Delete")
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      var randomNumber1=random35();
                      randomNumber=randomNumber1;
                      print(randomNumber);
                      print(randomNumber.runtimeType);
                    },
                    child: Text("Random")
                ),
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

 int? random35() {
Random random=new Random();
  randomNumber=random.nextInt(10000);
  //print(randomNumber);
  return randomNumber;
  }
}
