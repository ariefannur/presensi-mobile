import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:presensi_mobile/feature/login/login_screen.dart';
import 'package:presensi_mobile/utils/loging.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreenState();
  }
}

class _IntroScreenState extends State<IntroScreen> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Stack(children: [
          Align(alignment: Alignment.bottomCenter, child: DotPager(page)),
          PageView(
              controller: controller,
              onPageChanged: _onPageViewChange,
              children: <Widget>[
                Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Lottie.asset('assets/animation/phone.json',
                        width: 300, height: 550),
                    const Text(
                      "Aplikasi Sekolah",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(13, 71, 161, 1)),
                    ),
                  ],
                )),
                Center(
                    child: Column(
                  children: [
                    Lottie.asset('assets/animation/selfie.json',
                        width: 300, height: 550),
                    Text(
                      "Smart Absensi",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900]),
                    ),
                  ],
                )),
              ]),
          Align(
              alignment: Alignment.bottomRight,
              child: page == 1 ? const NextButton() : Container()),
        ]));
  }

  _onPageViewChange(int page) {
    setState(() {
      this.page = page;
    });
  }
}

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    loging("next button");

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(60, 60),
            onSurface: Colors.blue[900],
            onPrimary: Colors.blue[50],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () {
          _clickNext(context);
        },
      ),
    );
  }

  _clickNext(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}

class DotPager extends StatelessWidget {
  final int index;
  DotPager(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: index == 0 ? Colors.blue[900] : Colors.white,
                borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(width: 10),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: index == 1 ? Colors.blue[900] : Colors.white,
                borderRadius: BorderRadius.circular(50)),
          ),
        ],
      ),
    );
  }
}
