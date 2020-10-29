import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import '../Constants/Constants.dart' as Constants;
import 'addCommercial.dart';
import 'editCommercial.dart';

class MyCommercial extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyCommercial> {
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
    var response = await http.get(Uri.encodeFull(Constants.viewCommercial),
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
        title: new Text("Commercial"),
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
                    String _EBServices = datas[index]['EBServices'].toString();
                    String _TAX = datas[index]['TAX'].toString();
                    String _Rent = datas[index]['Rent'].toString();
                    String _NoofHouses = datas[index]['NoofHouses'].toString();
                    String _Numberofbedrooms1 =
                        datas[index]['_Numberofbedrooms1'].toString();
                    String _Rainwaterharvest =
                        datas[index]['Rainwaterharvest'].toString();
                    String _CorporationWater =
                        datas[index]['CorporationWater'].toString();
                    String _Metturwaterline =
                        datas[index]['Metturwaterline'].toString();
                    String _CarParking = datas[index]['CarParking'].toString();
                    String _YearofBuilding =
                        datas[index]['YearofBuilding'].toString();
                    String _Liftfacility =
                        datas[index]['Liftfacility'].toString();
                    String _Pillar = datas[index]['Pillar'].toString();
                    String _Others = datas[index]['Others'].toString();
                    String _Referby = datas[index]['Referby'].toString();
                    String _ReferbyName =
                        datas[index]['ReferbyName'].toString();
                    String _ReferbyContact =
                        datas[index]['ReferbyContact'].toString();
                    String _Budget = datas[index]['Budget'].toString();
                    String _BuildupArea =
                        datas[index]['BuildupArea'].toString();
                    String _LandArea = datas[index]['LandArea'].toString();
                    String _OwnersDetailsName =
                        datas[index]['OwnersDetailsName'].toString();
                    String _OwnersDetailsMobile =
                        datas[index]['OwnersDetailsMobile'].toString();
                    String _Sold = datas[index]['Sold'].toString();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new MyEditCommercial(
                                _id,
                                _Date,
                                _EBServices,
                                _TAX,
                                _Rent,
                                _NoofHouses,
                                _Numberofbedrooms1,
                                _Rainwaterharvest,
                                _CorporationWater,
                                _Metturwaterline,
                                _CarParking,
                                _YearofBuilding,
                                _Liftfacility,
                                _Pillar,
                                _Others,
                                _Referby,
                                _ReferbyName,
                                _ReferbyContact,
                                _Budget,
                                _BuildupArea,
                                _LandArea,
                                _OwnersDetailsName,
                                _OwnersDetailsMobile,
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
                                  datas[index]['Rent'].toString() + " Rs",
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
                                  datas[index]['LandArea'].toString(),
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
                                  datas[index]['Rent'].toString() + " Rs",
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyAddCommercial()));
            },
            icon: Icon(Icons.add),
            label: Text("ADD Commercial"),
            tooltip: 'Add Your Commercial',
            elevation: 5,
            splashColor: Colors.green,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
