import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:my_realestate/Houses/MyHouses.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home_screen.dart';
import '../Constants/Constants.dart' as Constants;

class MyAddHouses extends StatefulWidget {
  @override
  _MyAddTripState createState() => _MyAddTripState();
}

class _MyAddTripState extends State<MyAddHouses> {
  TextEditingController _Date = TextEditingController();
  TextEditingController _Area = TextEditingController();
  TextEditingController _Borewell = TextEditingController();
  TextEditingController _Facing = TextEditingController();
  TextEditingController _totalSizesq = TextEditingController();
  TextEditingController _Northsizesq = TextEditingController();
  TextEditingController _Eastsizesq = TextEditingController();
  TextEditingController _Westsizesq = TextEditingController();
  TextEditingController _Southsizesq = TextEditingController();
  TextEditingController _BoreMotortype = TextEditingController();
  TextEditingController _SumpCapacity = TextEditingController();
  TextEditingController _Pillartype = TextEditingController();
  TextEditingController _CornerSite = TextEditingController();
  TextEditingController _Watertank = TextEditingController();
  TextEditingController _CarParkingsize = TextEditingController();
  TextEditingController _Hallsize = TextEditingController();
  TextEditingController _Bedroomsize = TextEditingController();
  TextEditingController _Kitchensize = TextEditingController();
  TextEditingController _Dinningsize = TextEditingController();
  TextEditingController _Bathroomsize = TextEditingController();
  TextEditingController _Kitchengranite = TextEditingController();
  TextEditingController _ModelerKitchen = TextEditingController();
  TextEditingController _Woodwork = TextEditingController();
  TextEditingController _MainDoortype = TextEditingController();
  TextEditingController _WindowType = TextEditingController();
  TextEditingController _FlooringType = TextEditingController();
  TextEditingController _Painting = TextEditingController();
  TextEditingController _OtherDetails = TextEditingController();
  TextEditingController _Budget = TextEditingController();
  TextEditingController _OwnersDetailsName = TextEditingController();
  TextEditingController _OwnersDetailsContact = TextEditingController();
  TextEditingController _ReferbyName = TextEditingController();
  TextEditingController _ReferbyContact = TextEditingController();
  ProgressDialog pr;
  String branch_id, msg;
  int login_id;

  bool viewVisible = false;

  int _stsType = 0;
  int _stsDTCP = 0;
  int _stsUnapproved = 0;
  int _stsBApproval = 0;
  int _stsBPlan = 0;
  int _stsHTax = 0;
  int _stsLMap = 0;
  int _stsHType = 0;
  int _stsCWater = 0;
  int _stsLTWater = 0;
  int _stsEBtype = 0;
  int _stsEBconnection = 0;
  int _stsSeptic = 0;
  int _stsRain = 0;
  int _stsUDrinage = 0;
  int _stsDrinage = 0;
  int _stsABathroom = 0;
  int _stsCBathroom = 0;
  int _stsOBathroom = 0;
  int _stsCompoundWall = 0;
  int _stsFirstFloor = 0;
  int _stsPassageSide = 0;
  int _stsReferBy = 0;
  int _stsSold = 0;

  String _selectedType = null;
  String _selectedDTCP = null;
  String _selectedUnapproved = null;
  String _selectedBApproval = null;
  String _selectedBPlan = null;
  String _selectedHTax = null;
  String _selectedLMap = null;
  String _selectedHType = null;
  String _selectedCWater = null;
  String _selectedLTWater = null;
  String _selectedEBtype = null;
  String _selectedEBconnection = null;
  String _selectedSeptic = null;
  String _selectedRain = null;
  String _selectedUDrinage = null;
  String _selectedDrinage = null;
  String _selectedABathroom = null;
  String _selectedCBathroom = null;
  String _selectedOBathroom = null;
  String _selectedCompoundWall = null;
  String _selectedFirstFloor = null;
  String _selectedPassageSide = null;
  String _selectedReferBy = null;
  String _selectedSold = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStringValuesSF();
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

  List<DropdownMenuItem<String>> _BedRoomdropDownItem() {
    List<String> ddl = ["1 BHK", "2 BHK", "3 BHK", "4 BHK"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _TypedropDownItem() {
    List<String> ddl = ["New", "Old"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _EBTypedropDownItem() {
    List<String> ddl = ["Single Phase", "3 Phase"];
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

  List<DropdownMenuItem<String>> _EBdropDownItem() {
    List<String> ddl = [
      "Select EB Connection",
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

  List<DropdownMenuItem<String>> _BAppdropDownItem() {
    List<String> ddl = [
      "Select Building Approval",
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

  List<DropdownMenuItem<String>> _BPlandropDownItem() {
    List<String> ddl = [
      "Select Building Plan",
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

  List<DropdownMenuItem<String>> _SepticdropDownItem() {
    List<String> ddl = [
      "Select Septic Tank",
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

  List<DropdownMenuItem<String>> _ABathdropDownItem() {
    List<String> ddl = [
      "Select Attached Bathroom",
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

  List<DropdownMenuItem<String>> _CBathdropDownItem() {
    List<String> ddl = [
      "Select Common Bathroom",
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

  List<DropdownMenuItem<String>> _OBathdropDownItem() {
    List<String> ddl = [
      "Select Outer Bathroom",
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

  List<DropdownMenuItem<String>> _CompounddropDownItem() {
    List<String> ddl = [
      "Select Compound Wall",
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

  List<DropdownMenuItem<String>> _FirstdropDownItem() {
    List<String> ddl = [
      "Select First Floor",
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

  List<DropdownMenuItem<String>> _PassagedropDownItem() {
    List<String> ddl = [
      "Select Passage Side",
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

    Future AddHouseData() async {
      final uri = Constants.addHouses;

      Map data = {
        'Date': _Date.text.toString(),
        'Type': _selectedType.toString(),
        'Area': _Area.text.toString(),
        'DTCP': _selectedDTCP.toString(),
        'Unapproved': _selectedUnapproved.toString(),
        'BuildingApproval': _selectedBApproval.toString(),
        'BuildingPlan': _selectedBPlan.toString(),
        'Housetax': _selectedHTax.toString(),
        'HouseType': _selectedHType.toString(),
        'Corporationwater': _selectedCWater.toString(),
        'LTWater': _selectedLTWater.toString(),
        'Borewell': _Borewell.text.toString(),
        'Facing': _Facing.text.toString(),
        'totalSizesq': _totalSizesq.text.toString(),
        'Northsizesq': _Northsizesq.text.toString(),
        'Eastsizesq': _Eastsizesq.text.toString(),
        'Westsizesq': _Westsizesq.text.toString(),
        'Southsizesq': _Southsizesq.text.toString(),
        'EBType': _selectedEBtype.toString(),
        'TemporaryEBconnection': _selectedEBconnection.toString(),
        'BoreMotortype': _BoreMotortype.text.toString(),
        'SumpCapacity': _SumpCapacity.text.toString(),
        'Septictank': _selectedSeptic.toString(),
        'Pillartype': _Pillartype.text.toString(),
        'CornerSite': _CornerSite.text.toString(),
        'MAP': _selectedLMap.toString(),
        'MAPIMAGE': "testtimgggggggg",
        'Rainwaterharvest': _selectedRain.toString(),
        'Watertank': _Watertank.text.toString(),
        'Undergrounddrainage': _selectedUDrinage.toString(),
        'Drainage': _selectedDrinage.toString(),
        'CarParkingsize': _CarParkingsize.text.toString(),
        'Hallsize': _Hallsize.text.toString(),
        'Bedroomsize': _Bedroomsize.text.toString(),
        'Kitchensize': _Kitchensize.text.toString(),
        'Dinningsize': _Dinningsize.text.toString(),
        'Bathroomsize': _Bathroomsize.text.toString(),
        'AttachedBathroom': _selectedABathroom.toString(),
        'Commonbathroom': _selectedCBathroom.toString(),
        'OuterBathroom': _selectedOBathroom.toString(),
        'CompoundWall': _selectedCompoundWall.toString(),
        'Kitchengranite': _Kitchengranite.text.toString(),
        'ModelerKitchen': _ModelerKitchen.text.toString(),
        'Woodwork': _Woodwork.text.toString(),
        'Firstfloor': _selectedFirstFloor.toString(),
        'Passageside': _selectedPassageSide.toString(),
        'MainDoortype': _MainDoortype.text.toString(),
        'WindowType': _WindowType.text.toString(),
        'FlooringType': _FlooringType.text.toString(),
        'Painting': _Painting.text.toString(),
        'OtherDetails': _OtherDetails.text.toString(),
        'Budget': _Budget.text.toString(),
        'OwnersDetailsName': _OwnersDetailsName.text.toString(),
        'OwnersDetailsContact': _OwnersDetailsContact.text.toString(),
        'Refertype': _selectedReferBy.toString(),
        'ReferName': _ReferbyName.text.toString(),
        'ReferContact': _ReferbyContact.text.toString(),
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
            new MaterialPageRoute(builder: (context) => new MyHouses()));
      } else {
        pr.hide();
        bottomModel("" + msg);
      }
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD NEW HOUSES"),
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
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedType,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _TypedropDownItem(),
                      onChanged: (value) {
                        _selectedType = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsType = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Type'),
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
                        controller: _Area,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Area',
                          hintText: 'Enter Area',
                        ),
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
                          _stsDTCP = 1;
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
                      value: _selectedUnapproved,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _UnappdropDownItem(),
                      onChanged: (value) {
                        _selectedUnapproved = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsUnapproved = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Unapproved'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedBApproval,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _BAppdropDownItem(),
                      onChanged: (value) {
                        _selectedBApproval = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsBApproval = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Building Approval'),
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
                      value: _selectedBPlan,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _BPlandropDownItem(),
                      onChanged: (value) {
                        _selectedBPlan = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsBPlan = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Building Plan'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedHTax,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _TaxdropDownItem(),
                      onChanged: (value) {
                        _selectedHTax = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsHTax = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select House Tax'),
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
                      value: _selectedHType,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _BedRoomdropDownItem(),
                      onChanged: (value) {
                        _selectedHType = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsHType = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select House Type'),
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
                      value: _selectedLTWater,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _LTdropDownItem(),
                      onChanged: (value) {
                        _selectedLTWater = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsLTWater = 1;
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
                        textInputAction: TextInputAction.next,
                        controller: _Borewell,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Borewell',
                          hintText: 'Enter Borewell',
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
                        controller: _Facing,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Facing',
                          hintText: 'Enter Facing',
                        ),
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
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
                  SizedBox(width: 10),
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
                  SizedBox(width: 10),
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
                      value: _selectedEBtype,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _EBTypedropDownItem(),
                      onChanged: (value) {
                        _selectedEBtype = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsEBtype = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select EB Type'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedEBconnection,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _EBdropDownItem(),
                      onChanged: (value) {
                        _selectedEBconnection = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsEBconnection = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select EB Connection'),
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
                        controller: _BoreMotortype,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bore Motor Type',
                          hintText: 'Enter Bore Motor Type',
                        ),
                        keyboardType: TextInputType.number,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _SumpCapacity,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sump Capacity',
                          hintText: 'Enter Sump Capacity',
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
                      value: _selectedSeptic,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _SepticdropDownItem(),
                      onChanged: (value) {
                        _selectedSeptic = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsSeptic = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Septic Tank'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Pillartype,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pillar Type',
                          hintText: 'Enter Pillar Type',
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
                        controller: _CornerSite,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Corner Site',
                          hintText: 'Enter Corner Site',
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
                      value: _selectedRain,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _RWaterdropDownItem(),
                      onChanged: (value) {
                        _selectedRain = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsRain = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Rain Water'),
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
                        controller: _Watertank,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Water Tank',
                          hintText: 'Enter Water Tank',
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
                      value: _selectedUDrinage,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _UDrainagedropDownItem(),
                      onChanged: (value) {
                        _selectedUDrinage = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsUDrinage = 1;
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
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedDrinage,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _DrainagedropDownItem(),
                      onChanged: (value) {
                        _selectedDrinage = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsDrinage = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Drainage'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _CarParkingsize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'CarParking Size',
                          hintText: 'Enter CarParking Size',
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
                        controller: _Hallsize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Hall Size',
                          hintText: 'Enter Hall Size',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Bedroomsize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bedroom Size',
                          hintText: 'Enter Bedroom Size',
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
                        controller: _Kitchensize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Kitchen Size',
                          hintText: 'Enter Kitchen Size',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Dinningsize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Dinning Size',
                          hintText: 'Enter Dinning Size',
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
                        controller: _Bathroomsize,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Bathroom Size',
                          hintText: 'Enter Bathroom Size',
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
                      value: _selectedABathroom,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _ABathdropDownItem(),
                      onChanged: (value) {
                        _selectedABathroom = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsABathroom = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Attached Bathroom'),
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
                      value: _selectedCBathroom,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _CBathdropDownItem(),
                      onChanged: (value) {
                        _selectedCBathroom = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsCBathroom = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Common Bathroom'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedOBathroom,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _OBathdropDownItem(),
                      onChanged: (value) {
                        _selectedOBathroom = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsOBathroom = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Outer Bathroom'),
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
                      value: _selectedCompoundWall,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _CompounddropDownItem(),
                      onChanged: (value) {
                        _selectedCompoundWall = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsCompoundWall = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Compound Wall'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Kitchengranite,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Kitchen Granite',
                          hintText: 'Enter Kitchen Granite',
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
                        controller: _ModelerKitchen,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Modeler Kitchen',
                          hintText: 'Enter Modeler Kitchen',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Woodwork,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Wood Work',
                          hintText: 'Enter Wood Work',
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
                      value: _selectedFirstFloor,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _FirstdropDownItem(),
                      onChanged: (value) {
                        _selectedFirstFloor = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsFirstFloor = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select First Floor'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedPassageSide,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _PassagedropDownItem(),
                      onChanged: (value) {
                        _selectedPassageSide = value;
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _stsPassageSide = 1;
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Passage Side'),
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
                        controller: _MainDoortype,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Main Door Type',
                          hintText: 'Enter Main Door Type',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _WindowType,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Window Type',
                          hintText: 'Enter Window Type',
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
                        controller: _FlooringType,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Flooring Type',
                          hintText: 'Enter Flooring Type',
                        ),
                        keyboardType: TextInputType.text,
                        autofocus: false,
                      )),
                  SizedBox(width: 10),
                  Container(
                      width: 300,
                      child: TextField(
                        controller: _Painting,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Painting',
                          hintText: 'Enter Painting',
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
                        controller: _OtherDetails,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Other Details',
                          hintText: 'Enter Other Details',
                        ),
                        keyboardType: TextInputType.text,
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
                        controller: _OwnersDetailsContact,
                        style: TextStyle(fontSize: 25.0),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Owners Details Contact',
                          hintText: 'Enter Owners Details Contact',
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
                      value: _selectedLMap,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _MapdropDownItem(),
                      onChanged: (value) {
                        _selectedLMap = value;
                        setState(() {
                          _stsLMap = 1;
                          FocusScope.of(context).requestFocus(FocusNode());
                        });
                      },
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                      hint: Text('Select Land MAP'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    width: 300,
                    child: DropdownButton(
                      value: _selectedReferBy,
                      isExpanded: true,
                      elevation: 5,
                      underline: SizedBox(),
                      items: _ReferdropDownItem(),
                      onChanged: (value) {
                        _selectedReferBy = value;
                        _selectedReferBy == "Person"
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
                child: Text("ADD HOUSES"),
                color: Colors.orange,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  if (_Date.text == "") {
                    bottomModel("Please Enter Date");
                  } else if (_stsType == 0) {
                    bottomModel("Please Select Type");
                  } else if (_Area.text == "") {
                    bottomModel("Please Enter Area");
                  } else if (_stsDTCP == 0) {
                    bottomModel("Please Select DTCP");
                  } else if (_stsUnapproved == 0) {
                    bottomModel("Please Select UnApproved");
                  } else if (_stsBApproval == 0) {
                    bottomModel("Please Select Building Approval");
                  } else if (_stsBPlan == 0) {
                    bottomModel("Please Select Building Plan");
                  } else if (_stsHTax == 0) {
                    bottomModel("Please Select House Tax");
                  } else if (_stsHType == 0) {
                    bottomModel("Please Select House Type");
                  } else if (_stsCWater == 0) {
                    bottomModel("Please Select Corporation Water");
                  } else if (_stsLTWater == 0) {
                    bottomModel("Please Select LT Water");
                  } else if (_Borewell.text == "") {
                    bottomModel("Please Enter Borewell");
                  } else if (_Facing.text == "") {
                    bottomModel("Please Enter Facing");
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
                  } else if (_stsEBtype == 0) {
                    bottomModel("Please Select EB Type");
                  } else if (_stsEBconnection == 0) {
                    bottomModel("Please Select EB Connection");
                  } else if (_BoreMotortype.text == "") {
                    bottomModel("Please Enter Bore Motor Type");
                  } else if (_SumpCapacity.text == "") {
                    bottomModel("Please Enter Sump Capacity");
                  } else if (_stsSeptic == 0) {
                    bottomModel("Please Select Septic Tank");
                  } else if (_Pillartype.text == "") {
                    bottomModel("Please Enter Pillar Type");
                  } else if (_CornerSite.text == "") {
                    bottomModel("Please Enter Cornor Site");
                  } else if (_stsRain == 0) {
                    bottomModel("Please Select Rain Water");
                  } else if (_Watertank.text == "") {
                    bottomModel("Please Enter Water Tank");
                  } else if (_stsUDrinage == 0) {
                    bottomModel("Please Select Underground Drainage");
                  } else if (_stsDrinage == 0) {
                    bottomModel("Please Select Drainage");
                  } else if (_CarParkingsize.text == "") {
                    bottomModel("Please Enter Car Parking Size");
                  } else if (_Hallsize.text == "") {
                    bottomModel("Please Enter Hall Size");
                  } else if (_Bedroomsize.text == "") {
                    bottomModel("Please Enter Bedroom Size");
                  } else if (_Kitchensize.text == "") {
                    bottomModel("Please Enter Kitchen Size");
                  } else if (_Dinningsize.text == "") {
                    bottomModel("Please Enter Dinning Size");
                  } else if (_Bathroomsize.text == "") {
                    bottomModel("Please Enter Bathroom Size");
                  } else if (_stsABathroom == 0) {
                    bottomModel("Please Select Attached Bathroom");
                  } else if (_stsCBathroom == 0) {
                    bottomModel("Please Select Common Bathroom");
                  } else if (_stsOBathroom == 0) {
                    bottomModel("Please Select Outer Bathroom");
                  } else if (_stsCompoundWall == 0) {
                    bottomModel("Please Select Compound Wall");
                  } else if (_Kitchengranite.text == "") {
                    bottomModel("Please Enter Kitchen Granite");
                  } else if (_ModelerKitchen.text == "") {
                    bottomModel("Please Enter Modeler Kitchen");
                  } else if (_Woodwork.text == "") {
                    bottomModel("Please Enter Wood Work");
                  } else if (_stsFirstFloor == 0) {
                    bottomModel("Please Select First Floor");
                  } else if (_stsPassageSide == 0) {
                    bottomModel("Please Select Passage Side");
                  } else if (_MainDoortype.text == "") {
                    bottomModel("Please Enter Main Door Type");
                  } else if (_WindowType.text == "") {
                    bottomModel("Please Enter Window Type");
                  } else if (_FlooringType.text == "") {
                    bottomModel("Please Enter Flooring Type");
                  } else if (_Painting.text == "") {
                    bottomModel("Please Enter Painting");
                  } else if (_OtherDetails.text == "") {
                    bottomModel("Please Enter Other Details");
                  } else if (_Budget.text == "") {
                    bottomModel("Please Enter Budget");
                  } else if (_OwnersDetailsName.text == "") {
                    bottomModel("Please Enter Owner Name");
                  } else if (_OwnersDetailsContact.text == "") {
                    bottomModel("Please Enter Owner Mobile");
                  } else if (_stsLMap == 0) {
                    bottomModel("Please Select Land Map");
                  } else if (_stsReferBy == 0) {
                    bottomModel("Please Select ReferBy");
                  } else if (_stsSold == 0) {
                    bottomModel("Please Select Sold");
                  } else {
                    pr.show();
                    AddHouseData();
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
