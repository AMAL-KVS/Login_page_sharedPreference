import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDashboard(),
    );
  }
}

class MyDashboard extends StatefulWidget {
  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  late SharedPreferences logindata;
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                iconSize: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
            ),
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35)),
          ),
          title: Padding(
            padding: const EdgeInsets.all(50.50),
            child: Text(
              " HOME PAGE",
              style: GoogleFonts.lobsterTwo(
                  fontSize: 20, color: Color.fromARGB(255, 17, 202, 162)),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ListTile(
                  title: Text("I O S"),
                  subtitle: Text("IPHONE 14"),
                  leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/image/download.png")),
                  trailing: Icon(Icons.star)),
              ListTile(
                title: Text("Android"),
                subtitle: Text("SAMSUNG GALAXY"),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/image/android-logo-icon-vector-new.jpg")),
              ),
              ListTile(
                title: Text("ONE PLUS"),
                subtitle: Text("10 PRO"),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/image/Oneplus_newlogo_main_1584369675960.jpg")),
              ),
              ListTile(
                title: Text("MAC"),
                subtitle: Text("MAC AIR 2."),
                leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/image/apple_silicon_endframe__fm1b5djq7ziq_large_2x.jpg")),
              ),
              ElevatedButton(
                onPressed: () {
                  logindata.setBool('login', true);
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyLoginPage()));
                },
                child: Text('LogOut'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/image/rajan.jpg',
                    width: 200,
                    height: 100,
                  ),
                  Image.asset(
                    'assets/image/iphone 14.jpg',
                    width: 150,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/image/macbook-air-midnight-select-20220606.jpg',
                    width: 200,
                    height: 100,
                  ),
                  Image.asset(
                    'assets/image/iphone 3.jpg',
                    width: 150,
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
