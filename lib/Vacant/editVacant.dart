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
import 'MyVacant.dart';

class MyEditVacant extends StatefulWidget {
  final String _id,
      _Date1,
      _Area1,
      _totalSizesq1,
      _Northsizesq1,
      _Eastsizesq1,
      _Westsizesq1,
      _Southsizesq1,
      _Facing1,
      _RateperSq1,
      _DTCP1,
      _Unapproved1,
      _FrontRoadwidth1,
      _CornerSite1,
      _Corporationwater1,
      _LTWater1,
      _BorewellLevel1,
      _Drainage1,
      _Undergrounddrainage1,
      _EBPost1,
      _GuidelineValue1,
      _Budget1,
      _MAP1,
      _MAPIMAGE1,
      _EC1,
      _MainRoadFacing1,
      _Distance1,
      _EBLineCrossing1,
      _Vacantlandtax1,
      _RegisterOffice1,
      _OwnersDetailsName1,
      _OwnersDetailsMobile1,
      _Others1,
      _Refertype1,
      _ReferName1,
      _ReferContact1,
      _Sold1; //if you have multiple values add here
  MyEditVacant(
      this._id,
      this._Date1,
      this._Area1,
      this._totalSizesq1,
      this._Northsizesq1,
      this._Eastsizesq1,
      this._Westsizesq1,
      this._Southsizesq1,
      this._Facing1,
      this._RateperSq1,
      this._DTCP1,
      this._Unapproved1,
      this._FrontRoadwidth1,
      this._CornerSite1,
      this._Corporationwater1,
      this._LTWater1,
      this._BorewellLevel1,
      this._Drainage1,
      this._Undergrounddrainage1,
      this._EBPost1,
      this._GuidelineValue1,
      this._Budget1,
      this._MAP1,
      this._MAPIMAGE1,
      this._EC1,
      this._MainRoadFacing1,
      this._Distance1,
      this._EBLineCrossing1,
      this._Vacantlandtax1,
      this._RegisterOffice1,
      this._OwnersDetailsName1,
      this._OwnersDetailsMobile1,
      this._Others1,
      this._Refertype1,
      this._ReferName1,
      this._ReferContact1,
      this._Sold1,
      {Key key})
      : super(key: key);

  @override
  _MyAddTripState createState() => _MyAddTripState();
}

class _MyAddTripState extends State<MyEditVacant> {
  TextEditingController _Date = TextEditingController();
  TextEditingController _Area = TextEditingController();
  TextEditingController _totalSizesq = TextEditingController();
  TextEditingController _Northsizesq = TextEditingController();
  TextEditingController _Eastsizesq = TextEditingController();
  TextEditingController _Westsizesq = TextEditingController();
  TextEditingController _Southsizesq = TextEditingController();
  TextEditingController _RateperSq = TextEditingController();
  TextEditingController _FrontRoadwidth = TextEditingController();
  TextEditingController _BorewellLevel = TextEditingController();
  TextEditingController _EBPost = TextEditingController();
  TextEditingController _GuidelineValue = TextEditingController();
  TextEditingController _Budget = TextEditingController();
  TextEditingController _Distance = TextEditingController();
  TextEditingController _RegisterOffice = TextEditingController();
  TextEditingController _OwnersDetailsName = TextEditingController();
  TextEditingController _OwnersDetailsMobile = TextEditingController();
  TextEditingController _Others = TextEditingController();
  TextEditingController _ReferName = TextEditingController();
  TextEditingController _ReferContact = TextEditingController();
  ProgressDialog pr;
  String branch_id, msg;
  int login_id;
  bool viewVisible = false;

  String _selectedFacing = null;
  String _selectedDTCP = null;
  String _selectedUnapp = null;
  String _selectedCorner = null;
  String _selectedCorpo = null;
  String _selectedLTWater = null;
  String _selectedDrainage = null;
  String _selectedUnder = null;
  String _selectedEc = null;
  String _selectedMainroad = null;
  String _selectedEB = null;
  String _selectedVacant = null;
  String _selectedRefer = null;
  String _selectedSold = null;
  String _selectedMap = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Date.text = widget._Date1;
    _Area.text = widget._Area1;
    _totalSizesq.text = widget._totalSizesq1;
    _Northsizesq.text = widget._Northsizesq1;
    _Eastsizesq.text = widget._Eastsizesq1;
    _Westsizesq.text = widget._Westsizesq1;
    _Southsizesq.text = widget._Southsizesq1;
    if (_selectedFacing == "null") {
      _selectedFacing;
    } else {
      _selectedFacing = widget._Facing1;
    }
    _RateperSq.text = widget._RateperSq1;
    if (_selectedDTCP == "null") {
      _selectedDTCP;
    } else {
      _selectedDTCP = widget._DTCP1;
    }
    if (_selectedUnapp == "null") {
      _selectedUnapp;
    } else {
      _selectedUnapp = widget._Unapproved1;
    }
    _FrontRoadwidth.text = widget._FrontRoadwidth1;
    if (_selectedCorner == "null") {
      _selectedCorner;
    } else {
      _selectedCorner = widget._CornerSite1;
    }
    if (_selectedCorpo == "null") {
      _selectedCorpo;
    } else {
      _selectedCorpo = widget._Corporationwater1;
    }
    if (_selectedLTWater == "null") {
      _selectedLTWater;
    } else {
      _selectedLTWater = widget._LTWater1;
    }
    _BorewellLevel.text = widget._BorewellLevel1;
    if (_selectedDrainage == "null") {
      _selectedDrainage;
    } else {
      _selectedDrainage = widget._Drainage1;
    }

    if (_selectedUnder == "null") {
      _selectedUnder;
    } else {
      _selectedUnder = widget._Undergrounddrainage1;
    }
    _EBPost.text = widget._EBPost1;
    _GuidelineValue.text = widget._GuidelineValue1;
    _Budget.text = widget._Budget1;
    if (_selectedEc == "null") {
      _selectedEc;
    } else {
      _selectedEc = widget._EC1;
    }
    if (_selectedMainroad == "null") {
      _selectedMainroad;
    } else {
      _selectedMainroad = widget._MainRoadFacing1;
    }
    _Distance.text = widget._Distance1;
    if (_selectedEB == "null") {
      _selectedEB;
    } else {
      _selectedEB = widget._EBLineCrossing1;
    }
    if (_selectedVacant == "null") {
      _selectedVacant;
    } else {
      _selectedVacant = widget._Vacantlandtax1;
    }
    _RegisterOffice.text = widget._RegisterOffice1;
    _OwnersDetailsName.text = widget._OwnersDetailsName1;
    _OwnersDetailsMobile.text = widget._OwnersDetailsMobile1;
    _Others.text = widget._Others1;
    if (_selectedMap == "null") {
      _selectedMap;
    } else {
      _selectedMap = widget._MAP1;
    }
    if (_selectedRefer == "null") {
      _selectedRefer;
    } else {
      _selectedRefer = widget._Refertype1;
    }
    _ReferName.text = widget._ReferName1;
    _ReferContact.text = widget._ReferContact1;
    if (_selectedSold == "null") {
      _selectedSold;
    } else {
      _selectedSold = widget._Sold1;
    }
    getStringValuesSF();
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

    List<DropdownMenuItem<String>> _FacingdropDownItem() {
      List<String> ddl = ["North", "East", "West", "South"];
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

    List<DropdownMenuItem<String>> _DTCPdropDownItem() {
      List<String> ddl = [
        "Select DTCP",
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

    List<DropdownMenuItem<String>> _UnappdropDownItem() {
      List<String> ddl = [
        "Select Unapproved",
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

    List<DropdownMenuItem<String>> _CornordropDownItem() {
      List<String> ddl = [
        "Select Cornor Site",
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

    List<DropdownMenuItem<String>> _LTdropDownItem() {
      List<String> ddl = [
        "Select LT Water",
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

    List<DropdownMenuItem<String>> _DrainagedropDownItem() {
      List<String> ddl = [
        "Select Drainage",
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

    List<DropdownMenuItem<String>> _UDrainagedropDownItem() {
      List<String> ddl = [
        "Select Underground Drainage",
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

    List<DropdownMenuItem<String>> _MFacingdropDownItem() {
      List<String> ddl = [
        "Select Main Road Facing",
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

    List<DropdownMenuItem<String>> _EBCrossdropDownItem() {
      List<String> ddl = [
        "Select EB Line Crossing",
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

    List<DropdownMenuItem<String>> _TaxdropDownItem() {
      List<String> ddl = [
        "Select Tax",
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

    List<DropdownMenuItem<String>> _MapdropDownItem() {
      List<String> ddl = [
        "Select Map",
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

    List<DropdownMenuItem<String>> _ECdropDownItem() {
      List<String> ddl = [
        "Select EC",
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

    Future EditVacantData() async {
      final uri = Constants.editVacant + widget._id;

      Map data = {
        'Date': _Date.text.toString(),
        'Area': _Area.text.toString(),
        'totalSizesq': _totalSizesq.text.toString(),
        'Northsizesq': _Northsizesq.text.toString(),
        'Eastsizesq': _Eastsizesq.text.toString(),
        'Westsizesq': _Westsizesq.text.toString(),
        'Southsizesq': _Southsizesq.text.toString(),
        'Facing': _selectedFacing.toString(),
        'RateperSq': _RateperSq.text.toString(),
        'DTCP': _selectedDTCP.toString(),
        'Unapproved': _selectedUnapp.toString(),
        'FrontRoadwidth': _FrontRoadwidth.text.toString(),
        'CornerSite': _selectedCorner.toString(),
        'Corporationwater': _selectedCorpo.toString(),
        'LTWater': _selectedLTWater.toString(),
        'BorewellLevel': _BorewellLevel.text.toString(),
        'Drainage': _selectedDrainage.toString(),
        'Undergrounddrainage': _selectedUnder.toString(),
        'EBPost': _EBPost.text.toString(),
        'GuidelineValue': _GuidelineValue.text.toString(),
        'Budget': _Budget.text.toString(),
        'MAP': _selectedMap.toString(),
        'MAPIMAGE': "testtimgggggggg",
        'EC': _selectedEc.toString(),
        'MainRoadFacing': _selectedMainroad.toString(),
        'Distance': _Distance.text.toString(),
        'EBLineCrossing': _selectedEB.toString(),
        'Vacantlandtax': _selectedVacant.toString(),
        'RegisterOffice': _RegisterOffice.text.toString(),
        'OwnersDetailsName': _OwnersDetailsName.text.toString(),
        'OwnersDetailsMobile': _OwnersDetailsMobile.text.toString(),
        'Others': _Others.text.toString(),
        'Refertype': _selectedRefer.toString(),
        'ReferName': _ReferName.text.toString(),
        'ReferContact': _ReferContact.text.toString(),
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
            gravity: ToastGravity.CENTER,
            msg: "" + msg,
            toastLength: Toast.LENGTH_SHORT,
            textColor: Colors.green,
            backgroundColor: null,
            fontSize: 13.0);
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new MyVacant()));
      } else {
        pr.hide();
        bottomModel("" + msg);
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT VACANT LAND"),
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
                          labelText: 'Area',
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
                        controller: _totalSizesq,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Total Sq.ft',
                          hintText: 'Enter Total Sq.ft',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Northsizesq,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'North Sq.ft',
                          hintText: 'Enter North Sq.ft',
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
                        controller: _Eastsizesq,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'East Sq.ft',
                          hintText: 'Enter East Sq.ft',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Westsizesq,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'West Sq.ft',
                          hintText: 'Enter West Sq.ft',
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
                        controller: _Southsizesq,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'South Sq.ft',
                          hintText: 'Enter South Sq.ft',
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
                      value: _selectedFacing,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _FacingdropDownItem(),
                      onChanged: (value) {
                        _selectedFacing = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Facing'),
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
                        controller: _RateperSq,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Rate of Sq.ft',
                          hintText: 'Enter Rate per Sq.ft',
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
                      value: _selectedDTCP,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _DTCPdropDownItem(),
                      onChanged: (value) {
                        _selectedDTCP = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select DTCP'),
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
                      value: _selectedUnapp,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _UnappdropDownItem(),
                      onChanged: (value) {
                        _selectedUnapp = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Unapproved'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _FrontRoadwidth,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Front Road Width',
                          hintText: 'Enter Front Road Width',
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
                      value: _selectedCorner,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _CornordropDownItem(),
                      onChanged: (value) {
                        _selectedCorner = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Cornor Site'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedCorpo,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _CornordropDownItem(),
                      onChanged: (value) {
                        _selectedCorpo = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
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
                      value: _selectedLTWater,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _LTdropDownItem(),
                      onChanged: (value) {
                        _selectedLTWater = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select LT Water'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _BorewellLevel,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'BoreWell Level',
                          hintText: 'Enter BoreWell Level',
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
                      value: _selectedDrainage,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _DrainagedropDownItem(),
                      onChanged: (value) {
                        _selectedDrainage = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Drainage'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedUnder,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _UDrainagedropDownItem(),
                      onChanged: (value) {
                        _selectedUnder = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Underground Drainage'),
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
                        controller: _EBPost,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'EB Post',
                          hintText: 'Enter EB Post',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _GuidelineValue,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Guidline Value',
                          hintText: 'Enter Guidline Value',
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
                      value: _selectedEc,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _ECdropDownItem(),
                      onChanged: (value) {
                        _selectedEc = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select EC'),
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
                      value: _selectedMainroad,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _MFacingdropDownItem(),
                      onChanged: (value) {
                        _selectedMainroad = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Mainroad Facing'),
                    ),
                  ),
                  SizedBox(width: 10),
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
                      value: _selectedEB,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _EBCrossdropDownItem(),
                      onChanged: (value) {
                        _selectedEB = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select EB Line Crossing'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedVacant,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _TaxdropDownItem(),
                      onChanged: (value) {
                        _selectedVacant = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Tax'),
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
                        controller: _RegisterOffice,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Register Office',
                          hintText: 'Enter Register Office',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _OwnersDetailsName,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owner Name',
                          hintText: 'Enter Owner Name',
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
                        controller: _OwnersDetailsMobile,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owner Mobile',
                          hintText: 'Enter Owner Mobile',
                        ),
                        keyboardType: TextInputType.number,
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
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedMap,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _MapdropDownItem(),
                      onChanged: (value) {
                        _selectedMap = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select MAP'),
                    ),
                  ),
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
                child: Text("EDIT VACANT"),
                color: Colors.orange,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  if (_Date.text == "") {
                    bottomModel("Please Enter Date");
                  } else if (_Area.text == "") {
                    bottomModel("Please Enter Area");
                  } else if (_totalSizesq.text == "") {
                    bottomModel("Please Enter Total Sq.ft");
                  } else if (_Northsizesq.text == "") {
                    bottomModel("Please Enter North Sq.ft");
                  } else if (_Eastsizesq.text == "") {
                    bottomModel("Please Enter East Sq.ft");
                  } else if (_Westsizesq.text == "") {
                    bottomModel("Please Enter West Sq.ft");
                  } else if (_Southsizesq.text == "") {
                    bottomModel("Please Enter South Sq.ft");
                  } else if (_FrontRoadwidth.text == "") {
                    bottomModel("Please Enter Front Road Width");
                  } else if (_BorewellLevel.text == "") {
                    bottomModel("Please Enter Borewell Level");
                  } else if (_EBPost.text == "") {
                    bottomModel("Please Enter EB Post");
                  } else if (_GuidelineValue.text == "") {
                    bottomModel("Please Enter Guideline Value");
                  } else if (_Budget.text == "") {
                    bottomModel("Please Enter Budget");
                  } else if (_Distance.text == "") {
                    bottomModel("Please Enter Distance");
                  } else if (_RegisterOffice.text == "") {
                    bottomModel("Please Enter Register Office");
                  } else if (_OwnersDetailsName.text == "") {
                    bottomModel("Please Enter Owner Name");
                  } else if (_OwnersDetailsMobile.text == "") {
                    bottomModel("Please Enter Owner Mobile");
                  } else if (_Others.text == "") {
                    bottomModel("Please Enter Other");
                  } else {
                    pr.show();
                    EditVacantData();
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
