import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:presensi_mobile/feature/home/camera_screen.dart';
import 'package:presensi_mobile/feature/home/presensi_screen.dart';
import 'package:presensi_mobile/feature/home/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    PresensiScreen(),
    ProfileScreen(),
  ];

  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    getCamera();
  }

  getCamera() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CameraScreen(cameras.first)));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Presensi"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Akun"),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
