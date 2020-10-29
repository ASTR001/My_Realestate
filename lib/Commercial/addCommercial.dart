import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:my_realestate/Commercial/MyCommercial.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen.dart';
import '../Constants/Constants.dart' as Constants;

class MyAddCommercial extends StatefulWidget {
  @override
  _MyAddTripState createState() => _MyAddTripState();
}

class _MyAddTripState extends State<MyAddCommercial> {
  TextEditingController _Date = TextEditingController();
  TextEditingController _EBServices = TextEditingController();
  TextEditingController _TAX = TextEditingController();
  TextEditingController _Rent = TextEditingController();
  TextEditingController _NoofHouses = TextEditingController();
  TextEditingController _CarParking = TextEditingController();
  TextEditingController _YearofBuilding = TextEditingController();
  TextEditingController _Pillar = TextEditingController();
  TextEditingController _Others = TextEditingController();
  TextEditingController _ReferbyName = TextEditingController();
  TextEditingController _ReferbyContact = TextEditingController();
  TextEditingController _Budget = TextEditingController();
  TextEditingController _BuildupArea = TextEditingController();
  TextEditingController _LandArea = TextEditingController();
  TextEditingController _OwnersDetailsName = TextEditingController();
  TextEditingController _OwnersDetailsMobile = TextEditingController();
  ProgressDialog pr;
  String branch_id, msg;
  int login_id;

  bool viewVisible = false;

  int _stsBedRoom = 0;
  int _stsRWater = 0;
  int _stsCWater = 0;
  int _stsMWater = 0;
  int _stsLift = 0;
  int _stsReferBy = 0;
  int _stsSold = 0;

  String _selectedBedRoom = null;
  String _selectedRWater = null;
  String _selectedCWater = null;
  String _selectedMWater = null;
  String _selectedLift = null;
  String _selectedRefer = null;
  String _selectedSold = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      branch_id = prefs.getString('mylogid');
      login_id = prefs.getInt('myidd');
    });
  }

  List<DropdownMenuItem<String>> _BedRoomdropDownItem() {
    List<String> ddl = ["1 BHK", "2 BHK", "3 BHK", "4 BHK"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _ReferdropDownItem() {
    List<String> ddl = ["Direct", "Person"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _CWaterdropDownItem() {
    List<String> ddl = [
      "Select Corporation Water",
      "Yes",
      "No",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _RWaterdropDownItem() {
    List<String> ddl = [
      "Select Rain Water",
      "Yes",
      "No",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _MWaterdropDownItem() {
    List<String> ddl = [
      "Select Metur Water",
      "Yes",
      "No",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _SolddropDownItem() {
    List<String> ddl = [
      "Select Sold",
      "Yes",
      "No",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _LiftdropDownItem() {
    List<String> ddl = [
      "Select Lift",
      "Yes",
      "No",
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  void showWidget() {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      viewVisible = true;
      _stsReferBy = 1;
    });
  }

  void hideWidget() {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      viewVisible = false;
    });
  }

  bottomModel(String msg) {
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              decoration: BoxDecoration(color: Colors.pink),
              child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(msg,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0))));
        });
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
      borderRadius: 1.0,
//        backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 1.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
    );

    Future AddCommercialData() async {
      final uri = Constants.addCommercial;

      Map data = {
        'Date': _Date.text.toString(),
        'EBServices': _EBServices.text.toString(),
        'TAX': _TAX.text.toString(),
        'Rent': _Rent.text.toString(),
        'NoofHouses': _NoofHouses.text.toString(),
        'NoofBedRooms': _selectedBedRoom.toString(),
        'Rainwaterharvest': _selectedRWater.toString(),
        'CorporationWater': _selectedCWater.toString(),
        'Metturwaterline': _selectedMWater.toString(),
        'CarParking': _CarParking.text.toString(),
        'YearofBuilding': _YearofBuilding.text.toString(),
        'Liftfacility': _selectedLift.toString(),
        'Pillar': _Pillar.text.toString(),
        'Others': _Others.text.toString(),
        'Referby': _selectedRefer.toString(),
        'ReferbyName': _ReferbyName.text.toString(),
        'ReferbyContact': _ReferbyContact.text.toString(),
        'Budget': _Budget.text.toString(),
        'BuildupArea': _BuildupArea.text.toString(),
        'LandArea': _LandArea.text.toString(),
        'OwnersDetailsName': _OwnersDetailsName.text.toString(),
        'OwnersDetailsMobile': _OwnersDetailsMobile.text.toString(),
        'Sold': _selectedSold.toString()
      };
      String body = json.encode(data);

      http.Response response = await http.post(uri,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: body);
      print("ytfyuugbwde" + response.body);
      var jsonData = jsonDecode(response.body);
//      var result = jsonData['login'];

      msg = jsonData['status'];

      if (msg == "success") {
//        Navigator.pop(context);
        pr.hide();
        Fluttertoast.showToast(
            msg: "" + msg,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.black,
            backgroundColor: null,
            fontSize: 13.0);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyCommercial()));
      } else {
        pr.hide();
        bottomModel("" + msg);
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD COMMERCIAL"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                          autofocus: false,
                          controller: _Date,
                          style: TextStyle(fontSize: 25.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date',
                            hintText: 'Enter Date',
                          ),
                          onTap: () async {
                            DateTime date = DateTime(1900);
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));

                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');
                            final String formatted = formatter.format(date);
                            _Date.text = formatted;
                          })),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _EBServices,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'EB Services',
                          hintText: 'Enter EB Services',
                        ),
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _TAX,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'TAX',
                          hintText: 'Enter TAX',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Rent,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rent',
                          hintText: 'Enter Rent',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: _NoofHouses,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'No.of Houses',
                          hintText: 'Enter No.of Houses',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedBedRoom,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _BedRoomdropDownItem(),
                      onChanged: (value) {
                        _selectedBedRoom = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsBedRoom = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select BedRooms'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedRWater,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _RWaterdropDownItem(),
                      onChanged: (value) {
                        _selectedRWater = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsRWater = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Rain Water'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedCWater,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _CWaterdropDownItem(),
                      onChanged: (value) {
                        _selectedCWater = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsCWater = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Corporation Water'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedMWater,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _MWaterdropDownItem(),
                      onChanged: (value) {
                        _selectedMWater = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsMWater = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Mettur WaterLine'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _CarParking,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Car Parking',
                          hintText: 'Enter Car Parking',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _YearofBuilding,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Year of Building',
                          hintText: 'Enter Year of Building',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedLift,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _LiftdropDownItem(),
                      onChanged: (value) {
                        _selectedLift = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsLift = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Lift'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Pillar,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pillar',
                          hintText: 'Enter Pillar',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Others,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Others',
                          hintText: 'Enter Others',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Budget,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Budget',
                          hintText: 'Enter Budget',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedRefer,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _ReferdropDownItem(),
                      onChanged: (value) {
                        _selectedRefer = value;
                        _selectedRefer == "Person"
                            ? showWidget()
                            : hideWidget();
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Refer By'),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                maintainAnimation: true,
                maintainState: true,
                visible: viewVisible,
                child: SizedBox(height: 12)),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: viewVisible,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 300,
                        child: TextField(
                          controller: _ReferbyName,
                          style: TextStyle(fontSize: 25.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Refer Name',
                            hintText: 'Enter Refer Name',
                          ),
                          keyboardType: TextInputType.text,
                          autofocus: false,
                        )),
                    SizedBox(width: 10),
                    Container(
                        width: 300,
                        child: TextField(
                          controller: _ReferbyContact,
                          style: TextStyle(fontSize: 25.0),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Refer Contact',
                            hintText: 'Enter Refer Contact',
                          ),
                          keyboardType: TextInputType.number,
                          autofocus: false,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _BuildupArea,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Buildup Area',
                          hintText: 'Enter Buildup Area',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _LandArea,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Land Area',
                          hintText: 'Enter Land Area',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _OwnersDetailsName,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owners Details Name',
                          hintText: 'Enter Owners Details Name',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _OwnersDetailsMobile,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owners Details Mobile',
                          hintText: 'Enter Owners Details Mobile',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                ],
              ),
            ),
            SizedBox(height: 12),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 610,
                    child: DropdownButton(
                      value: _selectedSold,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _SolddropDownItem(),
                      onChanged: (value) {
                        _selectedSold = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsSold = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Sold'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 10.0),
              child: MaterialButton(
                textColor: Colors.white,
                highlightElevation: 2,
                child: Text("ADD COMMERCIAL"),
                color: Colors.orange,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  if (_Date.text == "") {
                    bottomModel("Please Enter Date");
                  } else if (_EBServices.text == "") {
                    bottomModel("Please Enter EBServices");
                  } else if (_TAX.text == "") {
                    bottomModel("Please Enter TAX");
                  } else if (_Rent.text == "") {
                    bottomModel("Please Enter Rent");
                  } else if (_NoofHouses.text == "") {
                    bottomModel("Please Enter No.of Houses");
                  } else if (_stsBedRoom == 0) {
                    bottomModel("Please Selct Bedrooms");
                  } else if (_stsRWater == 0) {
                    bottomModel("Please Select Rain Water");
                  } else if (_stsCWater == 0) {
                    bottomModel("Please Select Corporation Water");
                  } else if (_stsMWater == 0) {
                    bottomModel("Please Select Mettur WaterLine");
                  } else if (_CarParking.text == "") {
                    bottomModel("Please Enter Car Parking");
                  } else if (_YearofBuilding.text == "") {
                    bottomModel("Please Enter Year of Building");
                  } else if (_stsLift == 0) {
                    bottomModel("Please Select Lift Facility");
                  } else if (_Pillar.text == "") {
                    bottomModel("Please Enter Pillar");
                  } else if (_Others.text == "") {
                    bottomModel("Please Enter Others");
                  } else if (_Budget.text == "") {
                    bottomModel("Please Enter Budget");
                  } else if (_stsReferBy == 0) {
                    bottomModel("Please Select Referby");
                  } else if (_BuildupArea.text == "") {
                    bottomModel("Please Enter Buildup Area");
                  } else if (_LandArea.text == "") {
                    bottomModel("Please Enter Land Area");
                  } else if (_OwnersDetailsName.text == "") {
                    bottomModel("Please Enter Owners Details Name");
                  } else if (_OwnersDetailsMobile.text == "") {
                    bottomModel("Please Enter Owners Details Mobile");
                  } else if (_stsSold == 0) {
                    bottomModel("Please Select Sold");
                  } else {
                    pr.show();
                    AddCommercialData();
                  }
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
