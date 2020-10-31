//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:async';
//import 'dart:convert';
//import 'package:filter_list/filter_list.dart';
////import 'globals.dart' as globals;
//import 'text.dart';
//
//void main() {
//  runApp(MaterialApp(
//    home: HomePage(),
//    routes: {
////      '/hom': (context) => hom(),
//    },
//  ));
//}
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
////class OrderDetails {
////  static final Users= List filteredUsers;
////}
//
//class _HomePageState extends State<HomePage> {
//  var _controller = TextEditingController();
//
//  List data;
//  List userData;
////  MainButtons(this.filteredUsers);
//  List filteredUsers;
//
////  static final List filter = filteredUsers;
//
////  final String message;
////  final List filteredUsers;
////
////  LocationDetail(this.filteredUsers);
//
////  _HomePageState(this.filteredUsers);
////  final ScreenArguments args = ModalRoute.of().settings.arguments;
//  Future getData() async {
//    http.Response response =
//        await http.get("http://okayjourney.com/api/admin/search/takeofpoint");
//    data = json.decode(response.body);
//    setState(() {
//      userData = data;
//      filteredUsers = userData;
//    });
//  }
//
//  onItemChanged(String value) {
//    setState(() {
//      filteredUsers = userData
//          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
//          .toList();
//    });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    getData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
////    final location = Location.fetchByID(filteredUsers);
//
//    return Scaffold(
//      body: Column(
//        children: [
//          Container(
//            padding: EdgeInsets.only(top: 20),
//            decoration: BoxDecoration(
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black12,
//                  blurRadius: 1.0, // has the effect of softening the shadow
//                  spreadRadius: 1.0, // has the effect of extending the shadow
//                  offset: Offset(
//                    0.0, // horizontal, move right 10
//                    1.0, // vertical, move down 10
//                  ),
//                )
//              ],
//              color: Colors.white,
//            ),
//            child: TextField(
//              controller: _controller,
//              decoration: InputDecoration(
//                  contentPadding: EdgeInsets.all(10),
//                  border: InputBorder.none,
//                  hintText: 'search',
//                  suffix: IconButton(
//                    icon: Icon(Icons.close),
//                    onPressed: () {
//                      setState(() {
//                        _controller.clear();
//                        this.filteredUsers = userData;
//                      });
//                    },
//                  )),
//              onChanged: onItemChanged,
//            ),
//          ),
//          Row(
//            children: [
//              Padding(
//                padding: const EdgeInsets.only(top: 10, left: 25),
//                child: Text(
//                  'POPULAR CITIES',
//                  style: TextStyle(
//                      fontSize: 20,
//                      color: Colors.purple,
//                      fontWeight: FontWeight.w400),
//                ),
//              )
//            ],
//          ),
//          Divider(),
//          Expanded(
//            child: ListView.builder(
//              itemCount: this.filteredUsers.length,
//              itemBuilder: (context, index) {
////                Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                    builder: (context) => hom(),
////                    settings: RouteSettings(
////                      arguments: filteredUsers[0],
////                    ),
////                  ),
////                );
//                return ListTile(
//                  leading: Container(
//                      color: Colors.black54,
//                      padding:
//                          EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 5),
//                      margin: EdgeInsets.only(top: 4, left: 10),
//                      child: Text(
//                        'NPL',
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.w700),
//                      )),
//                  title: Text('${this.filteredUsers[index]}'[0].toUpperCase() +
//                      '${this.filteredUsers[index]}'
//                          .toLowerCase()
//                          .substring(1)),
//                  trailing: Text(
//                    'Nepal',
//                    style: TextStyle(color: Colors.black54),
//                  ),
//                  onTap: () {},
//                );
//              },
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
