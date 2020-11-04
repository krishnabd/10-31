//import 'dart:async';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
////import 'package:location/location.dart';
//import 'dart:typed_data';
//import 'package:flutter/services.dart';
//import 'package:geolocation/geolocation.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.purple[800],
//          titleSpacing: 7,
//          elevation: 0,
//          toolbarHeight: 70,
////          toolbarHeight: 100,
//          leading: Container(
////            margin: EdgeInsets.only(bottom: 10),
////            padding: EdgeInsets.only(left: 15),
//            child: IconButton(
//              padding: EdgeInsets.only(left: 15, bottom: 20),
//              icon: Icon(Icons.account_circle),
//              color: Colors.white,
//              iconSize: 70.0,
//              onPressed: () {},
//            ),
//          ),
//          actions: [
//            Container(
////              padding: EdgeInsets.only(bottom: 0),
//              child: IconButton(
//                icon: Icon(Icons.notifications),
//                color: Colors.white,
//                iconSize: 35,
//                onPressed: () {},
//              ),
//            ),
//            Container(
////              padding: EdgeInsets.only(bottom: 40),
//              child: IconButton(
//                icon: Icon(Icons.more_vert),
//                color: Colors.white,
//                iconSize: 35,
//                onPressed: () {},
//              ),
//            ),
//          ],
//          title: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//              Container(
//                  padding: EdgeInsets.only(top: 30),
//                  child: Padding(
//                    padding: const EdgeInsets.only(bottom: 15, left: 30),
//                    child: Text(
//                      'OkayJourney',
//                      style: TextStyle(fontWeight: FontWeight.w900),
//                    ),
//                  )),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 40, left: 23),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: [
//                    Text(
//                      'Booking Happiness',
//                      style:
//                          TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
//                    ),
//                    Text(
//                      '*Okay Point',
//                      style:
//                          TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//        bottomNavigationBar: CurvedNavigationBar(
////        currentIndex: _currentIndex,
//          index: 4,
//          color: Colors.white,
//          backgroundColor: Colors.purple[100],
//          buttonBackgroundColor: Colors.purple[600],
//          height: 50,
//          items: <Widget>[
//            Icon(Icons.place, size: 20, color: Colors.black),
//            Icon(Icons.favorite, size: 20, color: Colors.black),
//            Icon(Icons.home, size: 20, color: Colors.black),
//            Icon(Icons.history, size: 20, color: Colors.black),
//            Icon(Icons.chat, size: 20, color: Colors.black),
//          ],
////          onTap: (index) {
////            // this has changed
////            setState(() {
////              _currentIndex = index;
////            });
////            _onTap();
////          },
//        ),
//        body: Stack(
//          children: <Widget>[
//            GoogleMap(
//              onMapCreated: (GoogleMapController controller) {
//                _controller = controller;
//              },
//              initialCameraPosition: CameraPosition(
//                target: _center,
//                zoom: 11.0,
//              ),
//              mapType: _currentMapType,
//              markers: _markers,
//              onCameraMove: _onCameraMove,
//            ),
//            Padding(
//              padding: const EdgeInsets.all(16.0),
//              child: Align(
//                alignment: Alignment.topRight,
//                child: Column(
//                  children: <Widget>[
//                    FloatingActionButton(
//                      onPressed: _onMapTypeButtonPressed,
//                      materialTapTargetSize: MaterialTapTargetSize.padded,
//                      backgroundColor: Colors.purple[800],
//                      child: const Icon(Icons.map, size: 36.0),
//                    ),
//                    FloatingActionButton(
//                        child: Icon(Icons.location_searching),
//                        onPressed: () {
//                          getCurrentLocation();
//                        }),
//                    SizedBox(height: 16.0),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
