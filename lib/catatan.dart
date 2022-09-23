import 'package:catatan_rahasia/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Catatan extends StatefulWidget {
  @override
  _CatatanRahasia createState() => _CatatanRahasia();
}

class _CatatanRahasia extends State<Catatan> {
  final controllerText = TextEditingController();
  @override
  void initState() {
    showNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan rahasia'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: controllerText,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Bagaimana Hari ini?'),
          ),
        ),
        Container(
          height: 30,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          child: FlatButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text(controllerText.text),
                  );
                },
              );
              //Navigator.push(
              //  context, MaterialPageRoute(builder: (_) => saveNote()));
            },
            child: Text(
              'Simpan',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.all(5)),
        Container(
          height: 30,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5)),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MyHomePage()));
            },
            child: Text(
              'Batal',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        )
      ])),
    );
  }

  showNote() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefss.getString('stringValue');
    return stringValue;
  }

  saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', controllerText.text.toString());
  }
  /*saveNote() async {
    final prefs = await SharedPreferences.getInstance();
    if (controllerText == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("catatan kosong"),
      ));
    }
    await prefs.setString('secret', controllerText.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Berhasil"),
    ));
    FocusManager.instance.primaryFocus?.unfocus();
  }

  showNote() async {
    final prefs = await SharedPreferences.getInstance();
    var secret = prefs.getString('secret');
    setState(() {
      controllerText.text = secret!;
    });
  }
  */
}
