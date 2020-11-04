import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Map '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load('assets/zxc.png');
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
//          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
//          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData)
//        icon: Icon(Icons.notifications),
          );
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        titleSpacing: 7,
        elevation: 0,
        toolbarHeight: 70,
//          toolbarHeight: 100,
        leading: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.only(left: 15),
          child: IconButton(
            padding: EdgeInsets.only(left: 15, bottom: 20),
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            iconSize: 70.0,
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
//              padding: EdgeInsets.only(bottom: 0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.white,
              iconSize: 35,
              onPressed: () {},
            ),
          ),
          Container(
//              padding: EdgeInsets.only(bottom: 40),
            child: IconButton(
              icon: Icon(Icons.more_vert),
              color: Colors.white,
              iconSize: 35,
              onPressed: () {},
            ),
          ),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 30),
                  child: Text(
                    'OkayJourney',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Booking Happiness',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '*Okay Point',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
//        currentIndex: _currentIndex,
        index: 4,
        color: Colors.white,
        backgroundColor: Colors.purple[100],
        buttonBackgroundColor: Colors.purple[600],
        height: 50,
        items: <Widget>[
          Icon(Icons.place, size: 20, color: Colors.black),
          Icon(Icons.favorite, size: 20, color: Colors.black),
          Icon(Icons.home, size: 20, color: Colors.black),
          Icon(Icons.history, size: 20, color: Colors.black),
          Icon(Icons.chat, size: 20, color: Colors.black),
        ],
        onTap: (index) {
          // this has changed
          setState(() {
//            _currentIndex = index;
          });
//          _onTap();
        },
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(
          bottom: 120,
        ),
        height: 60,
        width: 40,
//        color: Colors.white,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
//            materialTapTargetSize: MaterialTapTargetSize.,
            child: Icon(
              Icons.location_searching,
              size: 40,
              color: Colors.purple,
            ),
            onPressed: () {
              getCurrentLocation();
            }),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker] : []),
        circles: Set.of((circle != null) ? [circle] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
    );
  }
}
