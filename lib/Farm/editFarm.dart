import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen.dart';
import '../Constants/Constants.dart' as Constants;
import 'MyFarm.dart';

class MyEditFarm extends StatefulWidget {
  final String _id,
      _Date1,
      _Area1,
      _Acers1,
      _NoofWells1,
      _Well1,
      _BoreWell1,
      _HP1,
      _FreeServices1,
      _EBServices1,
      _AgriLand1,
      _SuitableforSite1,
      _RoadFacility1,
      _MainRoadFacing1,
      _Roadfacedistance1,
      _SoilType1,
      _BusRoute1,
      _Fencing1,
      _WaterLevel1,
      _Canal1,
      _House1,
      _Distance1,
      _EBLinecrossing1,
      _RateperAcre1,
      _Budget1,
      _OwnersDetailsName1,
      _OwnersDetailsMobile1,
      _Referby1,
      _ReferbyName1,
      _ReferbyContact1,
      _OtherDetails1,
      _GuidelineValue1,
      _Sold1; //if you have multiple values add here
  MyEditFarm(
      this._id,
      this._Date1,
      this._Area1,
      this._Acers1,
      this._NoofWells1,
      this._Well1,
      this._BoreWell1,
      this._HP1,
      this._FreeServices1,
      this._EBServices1,
      this._AgriLand1,
      this._SuitableforSite1,
      this._RoadFacility1,
      this._MainRoadFacing1,
      this._Roadfacedistance1,
      this._SoilType1,
      this._BusRoute1,
      this._Fencing1,
      this._WaterLevel1,
      this._Canal1,
      this._House1,
      this._Distance1,
      this._EBLinecrossing1,
      this._RateperAcre1,
      this._Budget1,
      this._OwnersDetailsName1,
      this._OwnersDetailsMobile1,
      this._Referby1,
      this._ReferbyName1,
      this._ReferbyContact1,
      this._OtherDetails1,
      this._GuidelineValue1,
      this._Sold1,
      {Key key})
      : super(key: key);

  @override
  _MyAddTripState createState() => _MyAddTripState();
}

class _MyAddTripState extends State<MyEditFarm> {
  TextEditingController _Date = TextEditingController();
  TextEditingController _Area = TextEditingController();
  TextEditingController _Acers = TextEditingController();
  TextEditingController _NoofWells = TextEditingController();
  TextEditingController _BoreWell = TextEditingController();
  TextEditingController _HP = TextEditingController();
  TextEditingController _EB = TextEditingController();
  TextEditingController _Road = TextEditingController();
  TextEditingController _Mainroad = TextEditingController();
  TextEditingController _RoadDistance = TextEditingController();
  TextEditingController _Soil = TextEditingController();
  TextEditingController _Bus = TextEditingController();
  TextEditingController _Fensing = TextEditingController();
  TextEditingController _Water = TextEditingController();
  TextEditingController _Canel = TextEditingController();
  TextEditingController _House = TextEditingController();
  TextEditingController _Distance = TextEditingController();
  TextEditingController _Rate = TextEditingController();
  TextEditingController _RatePerAcer = TextEditingController();
  TextEditingController _Budget = TextEditingController();
  TextEditingController _OwnerName = TextEditingController();
  TextEditingController _OwnerMobile = TextEditingController();
  TextEditingController _ReferName = TextEditingController();
  TextEditingController _ReferContact = TextEditingController();
  TextEditingController _Other = TextEditingController();
  TextEditingController _Guidline = TextEditingController();
  ProgressDialog pr;
  String branch_id, msg;
  int login_id;

  bool viewVisible = false;

  String _selectedWell = null;
  String _selectedFreeService = null;
  String _selectedAgri = null;
  String _selectedSuitableSite = null;
  String _selectedEB = null;
  String _selectedRefer = null;
  String _selectedSold = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStringValuesSF();
    _Date.text = widget._Date1;
    _Area.text = widget._Area1;
    _Acers.text = widget._Acers1;
    _NoofWells.text = widget._NoofWells1;
    if (_selectedWell == "null") {
      _selectedWell;
    } else {
      _selectedWell = widget._Well1;
    }
    _BoreWell.text = widget._BoreWell1;
    _HP.text = widget._HP1;
    if (_selectedFreeService == "null") {
      _selectedFreeService;
    } else {
      _selectedFreeService = widget._FreeServices1;
    }
    _EB.text = widget._EBServices1;
    if (_selectedAgri == "null") {
      _selectedAgri;
    } else {
      _selectedAgri = widget._AgriLand1;
    }
    if (_selectedSuitableSite == "null") {
      _selectedSuitableSite;
    } else {
      _selectedSuitableSite = widget._SuitableforSite1;
    }
    _Road.text = widget._RoadFacility1;
    _Mainroad.text = widget._MainRoadFacing1;
    _RoadDistance.text = widget._Roadfacedistance1;
    _Soil.text = widget._SoilType1;
    _Bus.text = widget._BusRoute1;
    _Fensing.text = widget._Fencing1;
    _Water.text = widget._WaterLevel1;
    _Canel.text = widget._Canal1;
    _House.text = widget._House1;
    _Distance.text = widget._Distance1;
    if (_selectedEB == "null") {
      _selectedEB;
    } else {
      _selectedEB = widget._EBLinecrossing1;
    }
    _RatePerAcer.text = widget._RateperAcre1;
    _Budget.text = widget._Budget1;
    _OwnerName.text = widget._OwnersDetailsName1;
    _OwnerMobile.text = widget._OwnersDetailsMobile1;
    if (_selectedRefer == "null") {
      _selectedRefer;
    } else {
      _selectedRefer = widget._Referby1;
    }
    _ReferName.text = widget._ReferbyName1;
    _ReferContact.text = widget._ReferbyContact1;
    _Other.text = widget._OtherDetails1;
    _Guidline.text = widget._GuidelineValue1;
    if (_selectedSold == "null") {
      _selectedSold;
    } else {
      _selectedSold = widget._Sold1;
    }
  }

  void showWidget() {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      FocusScope.of(context).requestFocus(FocusNode());
      viewVisible = false;
    });
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      branch_id = prefs.getString('mylogid');
      login_id = prefs.getInt('myidd');
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

    List<DropdownMenuItem<String>> _ReferdropDownItem() {
      List<String> ddl = ["Direct", "Person"];
      return ddl
          .map((value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ))
          .toList();
    }

    List<DropdownMenuItem<String>> _WelldropDownItem() {
      List<String> ddl = ["Common", "Individual"];
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

    List<DropdownMenuItem<String>> _EBdropDownItem() {
      List<String> ddl = [
        "Select EB Line",
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

    List<DropdownMenuItem<String>> _SuitabledropDownItem() {
      List<String> ddl = [
        "Select Suitable Site",
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

    List<DropdownMenuItem<String>> _AgridropDownItem() {
      List<String> ddl = [
        "Select Agri Land",
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

    List<DropdownMenuItem<String>> _FreedropDownItem() {
      List<String> ddl = [
        "Select Free Service",
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

    Future AddFarmData() async {
      final uri = Constants.editFarm + widget._id;

      Map data = {
        'Date': _Date.text.toString(),
        'Area': _Area.text.toString(),
        'Acers': _Acers.text.toString(),
        'NoofWells': _NoofWells.text.toString(),
        'Well': _selectedWell.toString(),
        'BoreWell': _BoreWell.text.toString(),
        'HP': _HP.text.toString(),
        'FreeServices': _selectedFreeService.toString(),
        'EBServices': _EB.text.toString(),
        'AgriLand': _selectedAgri.toString(),
        'SuitableforSite': _selectedSuitableSite.toString(),
        'RoadFacility': _Road.text.toString(),
        'MainRoadFacing': _Mainroad.text.toString(),
        'Roadfacedistance': _RoadDistance.text.toString(),
        'SoilType': _Soil.text.toString(),
        'BusRoute': _Bus.text.toString(),
        'Fencing': _Fensing.text.toString(),
        'WaterLevel': _Water.text.toString(),
        'Canal': _Canel.text.toString(),
        'House': _House.text.toString(),
        'Distance': _Distance.text.toString(),
        'EBLinecrossing': _selectedEB.toString(),
        'RateperAcre': _RatePerAcer.text.toString(),
        'Budget': _Budget.text.toString(),
        'OwnersDetailsName': _OwnerName.text.toString(),
        'OwnersDetailsMobile': _OwnerMobile.text.toString(),
        'Referby': _selectedRefer.toString(),
        'ReferbyName': _ReferName.text.toString(),
        'ReferbyContact': _ReferContact.text.toString(),
        'OtherDetails': _Other.text.toString(),
        'GuidelineValue': _Guidline.text.toString(),
        'Sold': _selectedSold.toString()
      };
      String body = json.encode(data);

      http.Response response = await http.put(uri,
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
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.green,
            backgroundColor: null,
            fontSize: 13.0);
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => new MyFarm()));
      } else {
        pr.hide();
        bottomModel("" + msg);
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD FARM LAND"),
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
                        controller: _Area,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Area/Place',
                          hintText: 'Enter Area',
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
                        controller: _Acers,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Acers',
                          hintText: 'Enter Acers',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _NoofWells,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'No.of Wells',
                          hintText: 'Enter No.of Wells',
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
                    width: 300,
                    child: DropdownButton(
                      value: _selectedWell,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _WelldropDownItem(),
                      onChanged: (value) {
                        _selectedWell = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Well'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _BoreWell,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bore Well',
                          hintText: 'Enter Bore Well',
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
                        controller: _HP,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'HP',
                          hintText: 'Enter HP',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedFreeService,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _FreedropDownItem(),
                      onChanged: (value) {
                        _selectedFreeService = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Free Service'),
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
                        textInputAction: TextInputAction.next,
                        controller: _EB,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'EB Service',
                          hintText: 'Enter EB Service',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedAgri,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _AgridropDownItem(),
                      onChanged: (value) {
                        _selectedAgri = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Agri Land'),
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
                      value: _selectedSuitableSite,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _SuitabledropDownItem(),
                      onChanged: (value) {
                        _selectedSuitableSite = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Suitable Site'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Road,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Road Facility',
                          hintText: 'Enter Road Facility',
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
                        controller: _Mainroad,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'MainRoad Facing',
                          hintText: 'Enter MainRoad Facing',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _RoadDistance,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Road Face Distance',
                          hintText: 'Enter Road Face Distance',
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
                        controller: _Soil,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Soil Type',
                          hintText: 'Enter Soil Type',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Bus,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bus Route',
                          hintText: 'Enter Bus Route',
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
                        controller: _Fensing,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Fensing',
                          hintText: 'Enter Fensing',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Water,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Water Level',
                          hintText: 'Enter Water Level',
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
                        controller: _Canel,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Canel',
                          hintText: 'Enter Canel',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _House,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'House',
                          hintText: 'Enter House',
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
                        controller: _Distance,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Distance',
                          hintText: 'Enter Distance',
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
                      value: _selectedEB,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _EBdropDownItem(),
                      onChanged: (value) {
                        _selectedEB = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select EB Line'),
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
                        controller: _RatePerAcer,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rate Per Acer',
                          hintText: 'Enter Rate Per Acer',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
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
                        controller: _OwnerName,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owner Name',
                          hintText: 'Enter Owner Name',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _OwnerMobile,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owner Mobile',
                          hintText: 'Enter Owner Mobile',
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
                        controller: _Other,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Other',
                          hintText: 'Enter Other',
                        ),
                        keyboardType: TextInputType.text,
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
                          controller: _ReferName,
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
                          controller: _ReferContact,
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
                        controller: _Guidline,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Guidline Value',
                          hintText: 'Enter Guidline Value',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
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
                child: Text("EDIT FARM"),
                color: Colors.orange,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  if (_Date.text == "") {
                    bottomModel("Please Enter Date");
                  } else if (_Area.text == "") {
                    bottomModel("Please Enter Area");
                  } else if (_Acers.text == "") {
                    bottomModel("Please Enter Total Sq.ft");
                  } else if (_NoofWells.text == "") {
                    bottomModel("Please Enter North Sq.ft");
                  } else if (_HP.text == "") {
                    bottomModel("Please Enter HP");
                  } else if (_EB.text == "") {
                    bottomModel("Please Enter EB Service");
                  } else if (_Road.text == "") {
                    bottomModel("Please Enter Road Facility");
                  } else if (_Mainroad.text == "") {
                    bottomModel("Please Enter MainRoad Facing");
                  } else if (_RoadDistance.text == "") {
                    bottomModel("Please Enter Road Face Distance");
                  } else if (_Soil.text == "") {
                    bottomModel("Please Enter Soil Type");
                  } else if (_Bus.text == "") {
                    bottomModel("Please Enter Bus Route");
                  } else if (_Fensing.text == "") {
                    bottomModel("Please Enter Fensing");
                  } else if (_Water.text == "") {
                    bottomModel("Please Enter Water  Level");
                  } else if (_Canel.text == "") {
                    bottomModel("Please Enter Canel");
                  } else if (_House.text == "") {
                    bottomModel("Please Enter House");
                  } else if (_Distance.text == "") {
                    bottomModel("Please Enter Distance");
                  } else if (_RatePerAcer.text == "") {
                    bottomModel("Please Enter Rate Per Acer");
                  } else if (_Budget.text == "") {
                    bottomModel("Please Enter Budget");
                  } else if (_OwnerName.text == "") {
                    bottomModel("Please Enter Owner Name");
                  } else if (_OwnerMobile.text == "") {
                    bottomModel("Please Enter Owner Mobile");
                  } else if (_Other.text == "") {
                    bottomModel("Please Enter Other");
                  } else if (_Guidline.text == "") {
                    bottomModel("Please Enter Guidline Value");
                  } else {
                    pr.show();
                    AddFarmData();
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
