//import 'package:flutter/material.dart';
//
//import 'main.dart';
//
//class RouteListInfo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Column(
//        children: [
//          Container(
//            margin: EdgeInsets.only(top: 20, right: 10, left: 10),
//            decoration: BoxDecoration(
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.black12,
//                  blurRadius: 0.5, // has the effect of softening the shadow
//                  offset: Offset(
//                    0.0, // horizontal, move right 10
//                    5.0, // vertical, move down 10
//                  ),
//                )
//              ],
//              color: Colors.white,
//              borderRadius: BorderRadius.only(
//                topRight: Radius.circular(7.0),
//                bottomRight: Radius.circular(7.0),
//                topLeft: Radius.circular(7.0),
//                bottomLeft: Radius.circular(7.0),
//              ),
//            ),
//            padding: EdgeInsets.all(10),
//            child: RowIcons(),
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Padding(
//                padding: EdgeInsets.all(8.0),
//                child: Text(
//                  'Recent Searches',
//                  textAlign: TextAlign.left,
//                  style: TextStyle(
//                    fontSize: 18,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//              Text(
//                '1 buses found',
//                style: TextStyle(fontSize: 18),
//              ),
//              Text(
//                'Price',
//                style: TextStyle(fontSize: 18),
//              ),
//              Text(
//                'Time',
//                style: TextStyle(fontSize: 18),
//              ),
//            ],
//          ),
//          VehicleInfo(),
//        ],
//      ),
//    );
//  }
//}
//
//class VehicleInfo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    return Container(
////      margin: EdgeInsets.all(10),
////      padding: EdgeInsets.all(5),
////      decoration: BoxDecoration(
////        color: Colors.white,
////        boxShadow: [
////          BoxShadow(
////            color: Colors.black12,
////            offset: Offset(
////              1.0, // horizontal, move right 10
////              1.0, // vertical, move down 10
////            ),
////          )
////        ],
////      ),
////      child: Column(
////        crossAxisAlignment: CrossAxisAlignment.start,
////        children: [
////          Row(
////            children: [
////              Container(
////                padding: EdgeInsets.all(15),
////                decoration: BoxDecoration(
////                  boxShadow: [
////                    BoxShadow(
////                      color: Colors.black12,
////                      blurRadius: 5.0,
////                      offset: Offset(
////                        1.0, // horizontal, move right 10
////                        1.0, // vertical, move down 10
////                      ),
////                    )
////                  ],
////                  color: Colors.white,
////                  borderRadius: BorderRadius.all(Radius.circular(50)),
////                ),
////                child: IconButton(
////                  icon: Icon(
////                    Icons.directions_bus,
////                    size: 38,
////                  ),
////                  color: Colors.purple,
////                  onPressed: () {},
////                ),
////              ),
////              SizedBox(
////                width: 5,
////              ),
////              Column(
////                crossAxisAlignment: CrossAxisAlignment.start,
////                children: [
////                  Text(
////                    'Tribeni Darshan Yata Yat',
////                    style: TextStyle(
////                      fontWeight: FontWeight.bold,
////                      fontSize: 20,
////                      color: Colors.purple[900],
////                    ),
////                  ),
////                  Text(
////                    'Pvt.Ltd',
////                    style: TextStyle(
////                      fontWeight: FontWeight.bold,
////                      fontSize: 20,
////                      color: Colors.purple[900],
////                    ),
////                  ),
////                  Text(
////                    'Bus',
////                    style: TextStyle(
////                      fontSize: 18,
////                      color: Colors.grey,
////                    ),
////                  ),
////                  SizedBox(
////                    height: 15,
////                  ),
////                  Row(
////                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                    children: [
////                      Text(
////                        '6 AM',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.purple[900],
////                        ),
////                      ),
////                      Icon(
////                        Icons.navigate_next,
////                        color: Colors.purple[900],
////                        size: 22,
////                      ),
////                      Text(
////                        '7 H',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.grey,
////                        ),
////                      ),
////                      Icon(
////                        Icons.navigate_next,
////                        color: Colors.purple[900],
////                        size: 22,
////                      ),
////                      Text(
////                        '1 PM',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.grey,
////                        ),
////                      ),
////                    ],
////                  ),
////                  Divider(
////                    color: Colors.purple[900],
////                    height: 5,
////                    thickness: 10,
////                  ),
////                  Row(
////                    mainAxisAlignment: MainAxisAlignment.spaceAround,
////                    children: [
////                      Text(
////                        'Kathmandu',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.grey,
////                        ),
////                      ),
////                      Icon(
////                        Icons.navigate_next,
////                        color: Colors.purple[900],
////                        size: 22,
////                      ),
////                      Text(
////                        '500',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.red,
////                        ),
////                      ),
////                      Icon(
////                        Icons.navigate_next,
////                        color: Colors.purple[900],
////                        size: 22,
////                      ),
////                      Text(
////                        'Manthali',
////                        style: TextStyle(
////                          fontWeight: FontWeight.bold,
////                          fontSize: 18,
////                          color: Colors.grey,
////                        ),
////                      ),
////                    ],
////                  ),
////                ],
////              ),
////            ],
////          ),
////          Text(
////            'Amenities',
////            textAlign: TextAlign.left,
////            style: TextStyle(fontSize: 16),
////          ),
////          Text(
////            'water,wifi',
////            textAlign: TextAlign.left,
////            style: TextStyle(fontSize: 16, color: Colors.grey),
////          ),
////          Divider(
////            color: Colors.purple[900],
////            height: 5,
////            thickness: 4,
////          ),
////        ],
////      ),
////    );
//  }
//}
