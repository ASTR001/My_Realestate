import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../Constants/Constants.dart' as Constants;
import 'addFarm.dart';
import 'editFarm.dart';

class MyFarm extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyFarm> {
  List datas;
  String _id;

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      _id = prefs.getString('myidd');
      this.viewVacantData();
    });
  }

  Future<String> viewVacantData() async {
    var response = await http.get(Uri.encodeFull(Constants.viewFarm),
        headers: {"Accept": "application/json"});
    print(response.body);

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      datas = dataConvertedToJSON['response'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Farm Land"),
      ),
      body: ListView.builder(
          itemCount: datas == null ? 0 : datas.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyEditFarm(
                                datas[index]['_id'].toString(),
                                datas[index]['Date'].toString(),
                                datas[index]['Area'].toString(),
                                datas[index]['Acers'].toString(),
                                datas[index]['NoofWells'].toString(),
                                datas[index]['Well'].toString(),
                                datas[index]['BoreWell'].toString(),
                                datas[index]['HP'].toString(),
                                datas[index]['FreeServices'].toString(),
                                datas[index]['EBServices'].toString(),
                                datas[index]['AgriLand'].toString(),
                                datas[index]['SuitableforSite'].toString(),
                                datas[index]['RoadFacility'].toString(),
                                datas[index]['MainRoadFacing'].toString(),
                                datas[index]['Roadfacedistance'].toString(),
                                datas[index]['SoilType'].toString(),
                                datas[index]['BusRoute'].toString(),
                                datas[index]['Fencing'].toString(),
                                datas[index]['WaterLevel'].toString(),
                                datas[index]['Canal'].toString(),
                                datas[index]['House'].toString(),
                                datas[index]['Distance'].toString(),
                                datas[index]['EBLinecrossing'].toString(),
                                datas[index]['RateperAcre'].toString(),
                                datas[index]['Budget'].toString(),
                                datas[index]['OwnersDetailsName'].toString(),
                                datas[index]['OwnersDetailsMobile'].toString(),
                                datas[index]['Referby'].toString(),
                                datas[index]['ReferbyName'].toString(),
                                datas[index]['ReferbyContact'].toString(),
                                datas[index]['OtherDetails'].toString(),
                                datas[index]['GuidelineValue'].toString(),
                                datas[index]['Sold'].toString())));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  datas[index]['Date'].toString(),
                                  style: TextStyle(color: Colors.purple),
                                ),
                              ]),
                              Row(children: <Widget>[
                                Icon(
                                  Icons.home_work_outlined,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  datas[index]['Acers'].toString(),
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Icon(
                                  Icons.person,
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  datas[index]['OwnersDetailsName'].toString(),
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 18),
                                ),
                              ]),
                              Row(children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  datas[index]['Budget'].toString() + " Rs",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(children: <Widget>[
                            Icon(
                              Icons.map_outlined,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              datas[index]['Area'].toString(),
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            Spacer(),
                          ]),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Sold : ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              Text(
                                datas[index]['Sold'].toString(),
                                style: TextStyle(
                                    color:
                                        datas[index]['Sold'].toString() == "No"
                                            ? Colors.red
                                            : Colors.green,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyAddFarm()));
            },
            icon: Icon(Icons.add),
            label: Text("ADD VACANT"),
            tooltip: 'Add Your Vacant',
            elevation: 5,
            splashColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
