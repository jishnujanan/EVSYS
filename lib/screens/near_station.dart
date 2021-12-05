import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack4tkm/color/colors.dart';

class NearStation extends StatefulWidget {
  // Map<String, String>
  String near_station_data;
  NearStation({this.near_station_data});

  @override
  _NearStationState createState() => _NearStationState();
}

class _NearStationState extends State<NearStation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appbarcolor,
        title: Text("Your Station"),
        centerTitle: true,
      ),
      body: widget.near_station_data == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset("assets/error.gif")),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Something went wrong !",
                    style: TextStyle(fontSize: 24),
                  )
                ],
              ),
            )
          : Center(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                        child: Container(child: Image.asset('assets/car.gif'))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text(
                        jsonDecode(
                            widget.near_station_data)["place"] //["place"],
                        ,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        jsonDecode(widget.near_station_data)["min"].toString() +
                            " KM" //["place"],
                        ,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
    );
  }
}
