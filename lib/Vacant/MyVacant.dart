import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addVacant.dart';
import 'editVacant.dart';
import 'package:http/http.dart' as http;
import '../Constants/Constants.dart' as Constants;

class MyVacant extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyVacant> {
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
    var response = await http.get(Uri.encodeFull(Constants.viewVacant),
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
        title: new Text("Vacant Land"),
      ),
      body: ListView.builder(
          itemCount: datas == null ? 0 : datas.length,
          itemBuilder: (BuildContext context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    String _id = datas[index]['_id'].toString();
                    String _Date = datas[index]['Date'].toString();
                    String _Area = datas[index]['Area'].toString();
                    String _totalSizesq =
                        datas[index]['totalSizesq'].toString();
                    String _Northsizesq =
                        datas[index]['Northsizesq'].toString();
                    String _Eastsizesq = datas[index]['Eastsizesq'].toString();
                    String _Westsizesq = datas[index]['Westsizesq'].toString();
                    String _Southsizesq =
                        datas[index]['Southsizesq'].toString();
                    String _Facing = datas[index]['Facing'].toString();
                    String _RateperSq = datas[index]['RateperSq'].toString();
                    String _DTCP = datas[index]['DTCP'].toString();
                    String _Unapproved = datas[index]['Unapproved'].toString();
                    String _FrontRoadwidth =
                        datas[index]['FrontRoadwidth'].toString();
                    String _CornerSite = datas[index]['CornerSite'].toString();
                    String _Corporationwater =
                        datas[index]['Corporationwater'].toString();
                    String _LTWater = datas[index]['LTWater'].toString();
                    String _BorewellLevel =
                        datas[index]['BorewellLevel'].toString();
                    String _Drainage = datas[index]['Drainage'].toString();
                    String _Undergrounddrainage =
                        datas[index]['Undergrounddrainage'].toString();
                    String _EBPost = datas[index]['EBPost'].toString();
                    String _GuidelineValue =
                        datas[index]['GuidelineValue'].toString();
                    String _Budget = datas[index]['Budget'].toString();
                    String _MAP = datas[index]['MAP'].toString();
                    String _MAPIMAGE = datas[index]['MAPIMAGE'].toString();
                    String _EC = datas[index]['EC'].toString();
                    String _MainRoadFacing =
                        datas[index]['MainRoadFacing'].toString();
                    String _Distance = datas[index]['Distance'].toString();
                    String _EBLineCrossing =
                        datas[index]['EBLineCrossing'].toString();
                    String _Vacantlandtax =
                        datas[index]['Vacantlandtax'].toString();
                    String _RegisterOffice =
                        datas[index]['RegisterOffice'].toString();
                    String _OwnersDetailsName =
                        datas[index]['OwnersDetailsName'].toString();
                    String _OwnersDetailsMobile =
                        datas[index]['OwnersDetailsMobile'].toString();
                    String _Others = datas[index]['Others'].toString();
                    String _Refertype = datas[index]['Refertype'].toString();
                    String _ReferName = datas[index]['ReferName'].toString();
                    String _ReferContact =
                        datas[index]['ReferContact'].toString();
                    String _Sold = datas[index]['Sold'].toString();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyEditVacant(
                                _id,
                                _Date,
                                _Area,
                                _totalSizesq,
                                _Northsizesq,
                                _Eastsizesq,
                                _Westsizesq,
                                _Southsizesq,
                                _Facing,
                                _RateperSq,
                                _DTCP,
                                _Unapproved,
                                _FrontRoadwidth,
                                _CornerSite,
                                _Corporationwater,
                                _LTWater,
                                _BorewellLevel,
                                _Drainage,
                                _Undergrounddrainage,
                                _EBPost,
                                _GuidelineValue,
                                _Budget,
                                _MAP,
                                _MAPIMAGE,
                                _EC,
                                _MainRoadFacing,
                                _Distance,
                                _EBLineCrossing,
                                _Vacantlandtax,
                                _RegisterOffice,
                                _OwnersDetailsName,
                                _OwnersDetailsMobile,
                                _Others,
                                _Refertype,
                                _ReferName,
                                _ReferContact,
                                _Sold)));
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
                                  datas[index]['totalSizesq'].toString() +
                                      " sq.ft",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
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
                              ]),
                              Row(children: <Widget>[
                                Icon(
                                  Icons.landscape,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  datas[index]['DTCP'].toString(),
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ]),
                            ],
                          ),
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
                  .push(MaterialPageRoute(builder: (context) => MyAddVacant()));
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
