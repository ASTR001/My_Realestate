import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_realestate/Houses/MyHouses.dart';
import 'package:my_realestate/Widget/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Commercial/MyCommercial.dart';
import 'Farm/MyFarm.dart';
import 'Login/login_screen.dart';
import 'package:http/http.dart' as http;
import 'Constants/Constants.dart' as Constants;
import 'Vacant/MyVacant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name = '';
  String _mail = '';
  String _id = '';
  String _img = '';
  var no_of_trucks,
      no_of_drivers,
      no_of_customers,
      open_trips,
      closed_trips,
      invoiced_trips;
  String currentProfilePic =
      "https://avatars3.githubusercontent.com/u/16825392?s=460&v=4";

  List datas;
  var dashboardData;

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    setState(() {
      _name = prefs.getString('mynamee');
      _mail = prefs.getString('myemail');
      _id = prefs.getString('myidd');
      this.getDashboard();
    });
  }

  Future<String> getDashboard() async {
    final uri = Constants.dashboard_API;
    var map = new Map<String, dynamic>();
    map['branch_id'] = _id;

    http.Response response = await http.post(uri, body: map);
    print("ytfyuugb" + response.body);
    var jsonData = json.decode(response.body);
    no_of_trucks = jsonData["no_of_trucks"].toString();
    no_of_drivers = jsonData["no_of_drivers"].toString();
    no_of_customers = jsonData["no_of_customers"].toString();
    open_trips = jsonData["open_trips"].toString();
    closed_trips = jsonData["closed_trips"].toString();
    invoiced_trips = jsonData["invoiced_trips"].toString();

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DASHBOARD')),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 0.9,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyVacant()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFF06292), Color(0xFFFCE4EC)],
                        begin: Alignment.centerLeft,
                        end: Alignment(1.0, 1.0))),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                                image: AssetImage("assets/vacant.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text(
                                        'VACANT LAND',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(5.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                        no_of_trucks != null
                                            ? no_of_trucks
                                            : '10',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyHouses()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFF06292), Color(0xFFFCE4EC)],
                        begin: Alignment.centerLeft,
                        end: Alignment(1.0, 1.0))),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                                image: AssetImage("assets/house.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text(
                                        'NEW HOUSES',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(5.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                        no_of_trucks != null
                                            ? no_of_trucks
                                            : '10',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyCommercial()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFF06292), Color(0xFFFCE4EC)],
                        begin: Alignment.centerLeft,
                        end: Alignment(1.0, 1.0))),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                                image: AssetImage("assets/comm.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text(
                                        'COMMERCIAL',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(5.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                        no_of_trucks != null
                                            ? no_of_trucks
                                            : '10',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyFarm()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                        colors: [Color(0xFFF06292), Color(0xFFFCE4EC)],
                        begin: Alignment.centerLeft,
                        end: Alignment(1.0, 1.0))),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            image: DecorationImage(
                                image: AssetImage("assets/farm.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(7.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(7.0),
                                      child: new Text(
                                        'FARM LAND',
                                        style: new TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Padding(
                                padding: new EdgeInsets.all(5.0),
                                child: new Row(
                                  children: <Widget>[
                                    new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                        no_of_trucks != null
                                            ? no_of_trucks
                                            : '10',
                                        style: new TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: ClipPath(
        clipper: OvalRightBorderClipper(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Drawer(
          elevation: 16.0,
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("" + _name),
                accountEmail: Text("" + _mail),
                arrowColor: Colors.green,
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(currentProfilePic),
                  ),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "" + _img,
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 15.0);
                  },
                ),
                decoration: new BoxDecoration(gradient: blueGradient),
              ),
              ListTile(
                title: Text('Dashboard'),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomeScreen()));
                },
              ),
              Divider(
                height: 0.1,
              ),
              ListTile(
                title: Text('Vacant Land'),
                leading: Icon(
                  Icons.landscape,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyVacant()));
                },
              ),
              Divider(
                height: 0.1,
              ),
              ListTile(
                title: Text('New Houses'),
                leading: Icon(
                  Icons.home,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyHouses()));
                },
              ),
              Divider(
                height: 0.1,
              ),
              ListTile(
                title: Text('Commercial'),
                leading: Icon(
                  Icons.home_work,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyCommercial()));
                },
              ),
              Divider(
                height: 0.1,
              ),
              ListTile(
                title: Text('Farm Land'),
                leading: Icon(
                  Icons.map,
                  color: Colors.purple,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyFarm()));
                },
              ),
              Divider(
                height: 0.1,
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(
                  Icons.lock,
                  color: Colors.red,
                ),
                onTap: () {
                  logoutSts();
                  Fluttertoast.showToast(
                      msg: "Logout Success...",
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.white,
                      backgroundColor: Colors.red,
                      fontSize: 20.0);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new LoginScreen()));
                },
              ),
              Divider(
                height: 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  logoutSts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logSts', false);
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
