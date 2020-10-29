import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../Constants/Constants.dart' as Constants;
import 'addHouses.dart';
import 'editHouses.dart';

class MyHouses extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHouses> {
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
    var response = await http.get(Uri.encodeFull(Constants.viewHouses),
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
                    String _Type = datas[index]['Type'].toString();
                    String _Area = datas[index]['Area'].toString();
                    String _DTCP = datas[index]['DTCP'].toString();
                    String _Unapproved = datas[index]['Unapproved'].toString();
                    String _BuildingApproval =
                        datas[index]['BuildingApproval'].toString();
                    String _BuildingPlan =
                        datas[index]['BuildingPlan'].toString();
                    String _Housetax = datas[index]['Housetax'].toString();
                    String _HouseType = datas[index]['HouseType'].toString();
                    String _Corporationwater =
                        datas[index]['Corporationwater'].toString();
                    String _LTWater = datas[index]['LTWater'].toString();
                    String _Borewell = datas[index]['Borewell'].toString();
                    String _Facing = datas[index]['Facing'].toString();
                    String _totalSizesq =
                        datas[index]['totalSizesq'].toString();
                    String _Northsizesq =
                        datas[index]['Northsizesq'].toString();
                    String _Eastsizesq = datas[index]['Eastsizesq'].toString();
                    String _Westsizesq = datas[index]['Westsizesq'].toString();
                    String _Southsizesq =
                        datas[index]['Southsizesq'].toString();
                    String _EBType = datas[index]['EBType'].toString();
                    String _TemporaryEBconnection =
                        datas[index]['TemporaryEBconnection'].toString();
                    String _BoreMotortype =
                        datas[index]['BoreMotortype'].toString();
                    String _SumpCapacity =
                        datas[index]['SumpCapacity'].toString();
                    String _Septictank = datas[index]['Septictank'].toString();
                    String _Pillartype = datas[index]['Pillartype'].toString();
                    String _CornerSite = datas[index]['CornerSite'].toString();
                    String _MAP = datas[index]['MAP'].toString();
                    String _MAPIMAGE = datas[index]['MAPIMAGE'].toString();
                    String _Rainwaterharvest =
                        datas[index]['Rainwaterharvest'].toString();
                    String _Watertank = datas[index]['Watertank'].toString();
                    String _Undergrounddrainage =
                        datas[index]['Undergrounddrainage'].toString();
                    String _Drainage = datas[index]['Drainage'].toString();
                    String _CarParkingsize =
                        datas[index]['CarParkingsize'].toString();
                    String _Hallsize = datas[index]['Hallsize'].toString();
                    String _Bedroomsize =
                        datas[index]['Bedroomsize'].toString();
                    String _Kitchensize =
                        datas[index]['Kitchensize'].toString();
                    String _Dinningsize =
                        datas[index]['Dinningsize'].toString();
                    String _Bathroomsize =
                        datas[index]['Bathroomsize'].toString();
                    String _AttachedBathroom =
                        datas[index]['AttachedBathroom'].toString();
                    String _Commonbathroom =
                        datas[index]['Commonbathroom'].toString();
                    String _OuterBathroom =
                        datas[index]['OuterBathroom'].toString();
                    String _CompoundWall =
                        datas[index]['CompoundWall'].toString();
                    String _Kitchengranite =
                        datas[index]['Kitchengranite'].toString();
                    String _ModelerKitchen =
                        datas[index]['ModelerKitchen'].toString();
                    String _Woodwork = datas[index]['Woodwork'].toString();
                    String _Firstfloor = datas[index]['Firstfloor'].toString();
                    String _Passageside =
                        datas[index]['Passageside'].toString();
                    String _MainDoortype =
                        datas[index]['MainDoortype'].toString();
                    String _WindowType = datas[index]['WindowType'].toString();
                    String _FlooringType =
                        datas[index]['FlooringType'].toString();
                    String _Painting = datas[index]['Painting'].toString();
                    String _OtherDetails =
                        datas[index]['OtherDetails'].toString();
                    String _Budget = datas[index]['Budget'].toString();
                    String _OwnersDetailsName =
                        datas[index]['OwnersDetailsName'].toString();
                    String _OwnersDetailsContact =
                        datas[index]['OwnersDetailsContact'].toString();
                    String _Sold = datas[index]['Sold'].toString();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyEditHouses(
                                _id,
                                _Date,
                                _Type,
                                _Area,
                                _DTCP,
                                _Unapproved,
                                _BuildingApproval,
                                _BuildingPlan,
                                _Housetax,
                                _HouseType,
                                _Corporationwater,
                                _LTWater,
                                _Borewell,
                                _Facing,
                                _totalSizesq,
                                _Northsizesq,
                                _Eastsizesq,
                                _Westsizesq,
                                _Southsizesq,
                                _EBType,
                                _TemporaryEBconnection,
                                _BoreMotortype,
                                _SumpCapacity,
                                _Septictank,
                                _Pillartype,
                                _CornerSite,
                                _MAP,
                                _MAPIMAGE,
                                _Rainwaterharvest,
                                _Watertank,
                                _Undergrounddrainage,
                                _Drainage,
                                _CarParkingsize,
                                _Hallsize,
                                _Bedroomsize,
                                _Kitchensize,
                                _Dinningsize,
                                _Bathroomsize,
                                _AttachedBathroom,
                                _Commonbathroom,
                                _OuterBathroom,
                                _CompoundWall,
                                _Kitchengranite,
                                _ModelerKitchen,
                                _Woodwork,
                                _Firstfloor,
                                _Passageside,
                                _MainDoortype,
                                _WindowType,
                                _FlooringType,
                                _Painting,
                                _OtherDetails,
                                _Budget,
                                _OwnersDetailsName,
                                _OwnersDetailsContact,
                                datas[index]['Refertype'].toString(),
                                datas[index]['ReferName'].toString(),
                                datas[index]['ReferContact'].toString(),
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
                                      "sq.ft",
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
                  .push(MaterialPageRoute(builder: (context) => MyAddHouses()));
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
