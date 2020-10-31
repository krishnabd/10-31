import 'package:flutter/material.dart';
//import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'searchpart.dart';

void main() {
  runApp(MaterialApp(
    home: hom(),
    routes: {
//      '/list': (context) => HomePage(),
    },
  ));
}

class hom extends StatefulWidget {
  var list;
  var ex;
  List yu;
  hom({this.list, this.ex, this.yu});

  @override
  _homState createState() => _homState();
}

class _homState extends State<hom> {
//  var asdd=widget.list;
  @override
  Widget build(BuildContext context) {
//    final String todo = ModalRoute.of(context).settings.arguments;
//    final String tod = ModalRoute.of(context).settings.arguments;
//    Navigator.pop(context, username);
//     var krishna = new todo;
//    widget.yu = [
//      '${widget.ex == null ? 'Kathmandu' : widget.ex}',
//      '${widget.list == null ? 'Biratnagar' : widget.list}'
//    ];
    final DATA = hom(yu: [
      '${widget.ex == null ? 'Kathmandu' : widget.ex}',
      '${widget.list == null ? 'Biratnagar' : widget.list}'
    ]);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: InkWell(
                    child: Text(
                        '${widget.ex == null ? 'Kathmandu' : widget.ex}',
                        style: TextStyle(color: Colors.purple)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      setState(() {});

//                      debugPrint(_HomePageState._id.toString());
                    },
                  ),
                ),
                InkWell(
                  child: Text(
                      '${widget.list == null ? 'Biratnagar' : widget.list}',
                      style: TextStyle(color: Colors.purple)),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => next()),
                      );
                    });

                    debugPrint(widget.list.toString());
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50, right: 50),
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 120.0),
                    color: Colors.purple[800],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    splashColor: Colors.purpleAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => searchpart(
                                  DATA: DATA,
                                )),
                      );
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}

//class OrderDetails {
//  static final Users= List filteredUsers;
//}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//class OrderDetails {
////  static final Users= List filteredUsers;
////}
//class IDCardClass {
//  static List filteredUsers;
//}

class _HomePageState extends State<HomePage> {
  var _controller = TextEditingController();
  List data;
  List userData;
//  MainButtons(this.filteredUsers);
  List filteredUsers;
//  List imageFile = IDCardClass.filteredUsers;
//  @override
//  void initState() {
//    super.initState();
//    filteredUsers = widget.filteredUsers;
//  }
  static var krishna;
  static int _id;
  Future getData() async {
    http.Response response =
        await http.get("http://okayjourney.com/api/admin/search/takeofpoint");
    data = json.decode(response.body);
    setState(() {
      userData = data;
      filteredUsers = userData;
    });
  }

  onItemChanged(String value) {
    setState(() {
      filteredUsers = userData
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
//    final location = Location.fetchByID(filteredUsers);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1.0, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    1.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  icon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'search',
                  suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        filteredUsers = userData;
                      });
                    },
                  )),
              onChanged: onItemChanged,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  'POPULAR CITIES',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 5),
                      margin: EdgeInsets.only(top: 4, left: 10),
                      child: Text(
                        'NPL',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )),
                  title: Text('${filteredUsers[index]}'[0].toUpperCase() +
                      '${filteredUsers[index]}'.toLowerCase().substring(1)),
                  trailing: Text(
                    'Nepal',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    debugPrint(filteredUsers[index].toString());
                    setState(() {
//                      debugPrint(krishna.toString());
//                      _id = index;
//                      krishna = '${filteredUsers[_id]}';
                      krishna = filteredUsers[index].toString();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hom(
                            ex: filteredUsers[index].toString(),
                            list: _nextState.krishna,
                          ),
                        ),
                      );

//                      debugPrint(_id.toString());
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class next extends StatefulWidget {
  @override
  _nextState createState() => _nextState();
}

class _nextState extends State<next> {
  var _controller = TextEditingController();
  List dat;
  List userDat;
//  MainButtons(this.filteredUsers);
  static List filteredUser;
//  List imageFile = IDCardClass.filteredUsers;
//  @override
//  void initState() {
//    super.initState();
//    filteredUsers = widget.filteredUsers;
//  }
  static var krishna;
  static int _id;
  Future getData() async {
    http.Response response =
        await http.get("http://okayjourney.com/api/admin/search/takeofpoint");
    dat = json.decode(response.body);
    setState(() {
      userDat = dat;
      filteredUser = userDat;
    });
  }

  onItemChanged(String value) {
    setState(() {
      filteredUser = userDat
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
//    final location = Location.fetchByID(filteredUsers);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1.0, // has the effect of softening the shadow
                  spreadRadius: 1.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    1.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
            ),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  icon: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'search',
                  suffix: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                        filteredUser = userDat;
                      });
                    },
                  )),
              onChanged: onItemChanged,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25),
                child: Text(
                  'POPULAR CITIES',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUser.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                      color: Colors.black54,
                      padding:
                          EdgeInsets.only(right: 5, left: 5, bottom: 5, top: 5),
                      margin: EdgeInsets.only(top: 4, left: 10),
                      child: Text(
                        'NPL',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )),
                  title: Text('${filteredUser[index]}'[0].toUpperCase() +
                      '${filteredUser[index]}'.toLowerCase().substring(1)),
                  trailing: Text(
                    'Nepal',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
//                      debugPrint(krishna.toString());
//                      _id = index;
//                      krishna = '${filteredUsers[_id]}';
                      krishna = filteredUser[index].toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => hom(
                            list: filteredUser[index].toString(),
                            ex: _HomePageState.krishna,
                          ),
                        ),
                      );

//                      debugPrint(_id.toString());

//                      debugPrint(filteredUser[index].toString());

//                      _id = index;
//                      krishna = '${filteredUser[_id]}';

//                      debugPrint(_id.toString());
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
