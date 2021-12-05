import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack4tkm/color/colors.dart';
import 'package:hack4tkm/database/dbervice.dart';
import 'package:hack4tkm/screens/near_station.dart';

class Upload extends StatefulWidget {
  const Upload({Key key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  DatabaseService _databaseService = DatabaseService();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String result;

  String fuel, x, y;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    print(result);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Next Station"),
        centerTitle: true,
        backgroundColor: appbarcolor,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.blue[900]],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              tileMode: TileMode.mirror,
              stops: [0.7, 15]),
        ),*/
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.10,
              vertical: MediaQuery.of(context).size.height * 0.05),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty ? 'invalid' : null,
                  onChanged: (value) => fuel = value,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "enter remaining fuel",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: false,
                      fillColor: Colors.grey[300],
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          gapPadding: 2,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty ? 'invalid' : null,
                  onChanged: (value) => x = value,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "enter latitude",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: false,
                      fillColor: Colors.grey[300],
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          gapPadding: 2,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                TextFormField(
                  validator: (value) =>
                      value == null || value.isEmpty ? 'invalid' : null,
                  onChanged: (value) => y = value,
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "enter longitude",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: false,
                      fillColor: Colors.grey[300],
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          gapPadding: 2,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.030,
                ),
                MaterialButton(
                  hoverColor: buttoncolor,
                  onPressed: () async {
                    if (_globalKey.currentState.validate()) {
                      print("Valid");
                      print(fuel);
                      setState(() {
                        loading = true;
                      });
                      result = await _databaseService.getData(fuel, x, y);
                      setState(() {
                        loading = false;
                      });
                      if (result == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NearStation(
                                near_station_data: result,
                              ),
                            ));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NearStation(
                                near_station_data: result,
                              ),
                            ));
                      }
                    } else {
                      print("invalid");
                    }
                  },
                  color: Colors.indigoAccent[400],
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: loading
          ? LinearProgressIndicator(
              backgroundColor: Colors.white,
              minHeight: 4,
              valueColor: new AlwaysStoppedAnimation<Color>(appbarcolor),
            )
          : Text(""),
    );
  }
}
