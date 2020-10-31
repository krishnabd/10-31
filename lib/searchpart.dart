import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'text.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bus',
        home: searchpart(),
      ),
    );

class searchpart extends StatefulWidget {
//  DATA.yu=List asd;
//  List yuU = DATA.yu;
  final hom DATA;
  searchpart({this.DATA});
  @override
  _searchpartState createState() => _searchpartState();
}

class Student {
  List studentId;

  Student({
    this.studentId,
  });
}

class _searchpartState extends State<searchpart> {
//  hom({this.list, this.ex, this.yu}) {}
//  List ui = widget.DATA;
//  var asd = widget.DATA;

  final String url =
      'https://okayjourney.com/api/mobile/busfromto/busnumberDateWithShiftAndType?from=Kathmandu&to=Manthali&date=2077-5-5&shift=any&types=any&fbclid=IwAR3AW5ZSU48sPCP_kMHu0zIfaZ4CeKglzwyJDlmCpQaaVmbQB1a3t86CE5s';
  Map data;
  Map convertDataToJson;
  Map ghee;
  static List milk;
  static List zxc;
  static var transportName;
  static var departTime;
  static var arrivalTime;
  static var aminity;
  static var price;
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {'Accept': 'application/json'});
//    print(response.body);
    setState(() {
      convertDataToJson = json.decode(response.body);
      data = convertDataToJson['trendbuskeyvalue'];
      ghee = data["busnumber234567xzcvxvc"];
      milk = ghee["takofPoints"];
      transportName = ghee["busname"];
      departTime = ghee["departTime"];
      arrivalTime = ghee["arrivalTIme"];
      aminity = ghee["facility"];
      price = ghee["price"];
//      dataa = data;
//      zxc = widget.DATA;
    });
//    debugPrint('$milk');
//    debugPrint(widget.DATA);
//    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    zxc = widget.DATA.yu;
    debugPrint(zxc.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2.0, // has the effect of softening the shadow
                  spreadRadius: 2.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7.0),
                bottomRight: Radius.circular(7.0),
                topLeft: Radius.circular(7.0),
                bottomLeft: Radius.circular(7.0),
              ),
            ),
            padding: EdgeInsets.all(10),
            child: rowIcons(),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 25),
//                child: Text(
//                  '${data}',
//                  style: TextStyle(
//                      fontSize: 15,
//                      color: Colors.black,
//                      fontWeight: FontWeight.w600),
//                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Buses found',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 32),
                      child: Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 30,
                      margin: const EdgeInsets.only(top: 15, left: 30),
                      child: IconButton(
                        icon: Icon(Icons.arrow_downward),
                        color: Colors.black,
                        iconSize: 20,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 32),
                      child: Text(
                        'Time',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      width: 30,
                      margin: const EdgeInsets.only(top: 15, left: 30),
                      child: IconButton(
                        icon: Icon(Icons.arrow_downward),
                        color: Colors.black,
                        iconSize: 20,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),

//              Container(
//                margin: EdgeInsets.only(right: 10, top: 15),
//                child: Text(
//                  'Time',
//                  style: TextStyle(
//                      fontSize: 15,
//                      color: Colors.black,
//                      fontWeight: FontWeight.w400),
//                ),
//              ),
//              Container(
//                width: 30,
//                padding: const EdgeInsets.only(left: 10, top: 15),
//                child: IconButton(
//                  icon: Icon(Icons.arrow_downward),
//                  color: Colors.black,
//                  iconSize: 20,
//                  onPressed: () {},
//                ),
//              ),
            ],
          ),
          Center(
            child: _condition(),
          )
        ],
      ),
    );
  }
}

Widget _condition() {
  List selectedplaces = ['Kathmandu', 'Biratnagar'];
  List tenplaceslist = [];

  String place1 = '${_searchpartState.zxc[0]}'[0].toUpperCase() +
      '${_searchpartState.zxc[0]}'.toLowerCase().substring(1);
  String place2 = '${_searchpartState.zxc[1]}'[0].toUpperCase() +
      '${_searchpartState.zxc[1]}'.toLowerCase().substring(1);
  String transport = _searchpartState.transportName;
  String depart = _searchpartState.departTime;
  String arrival = _searchpartState.arrivalTime;
  String facility = _searchpartState.aminity;
  String price = _searchpartState.price;
//  String place2 = _searchpartState.zxc[1];
  debugPrint(place1);
  if (_searchpartState.milk.contains(place1) &&
      _searchpartState.milk.contains(place2)) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              1.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(
                        1.0, // horizontal, move right 10
                        1.0, // vertical, move down 10
                      ),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.directions_bus,
                    size: 38,
                  ),
                  color: Colors.purple,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transport,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple[900],
                    ),
                  ),
                  Text(
                    _searchpartState.departTime,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        depart,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.purple[900],
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.purple[900],
                        size: 22,
                      ),
                      Text(
                        '7 H',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.purple[900],
                        size: 22,
                      ),
                      Text(
                        'arrival',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.purple[900],
                    height: 5,
                    thickness: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        place1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.purple[900],
                        size: 22,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.purple[900],
                        size: 22,
                      ),
                      Text(
                        place2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Amenities',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            facility,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Divider(
            color: Colors.purple[900],
            height: 5,
            thickness: 4,
          ),
        ],
      ),
    );
  } else {
    return Container(
      child: Row(
        children: [Text('zxccc')],
      ),
    );
    //do this
  }
}

Widget rowIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.directions_bus),
            color: Colors.purple,
            onPressed: () {},
          ),
          Text('Bus', style: TextStyle(fontSize: 20)),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.directions_car),
            color: Colors.purple,
            onPressed: () {},
          ),
          Text('Sumo', style: TextStyle(fontSize: 20)),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.local_taxi),
            color: Colors.purple,
            onPressed: () {},
          ),
          Text('Hiace', style: TextStyle(fontSize: 20)),
        ],
      ),
      Column(
        children: [
          IconButton(
            icon: Icon(Icons.place),
            color: Colors.purple,
            onPressed: () {},
          ),
          Text('Tour', style: TextStyle(fontSize: 20)),
        ],
      ),
    ],
  );
}
