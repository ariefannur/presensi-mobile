import 'package:flutter/material.dart';
import 'package:presensi_mobile/utils/color.dart';
import 'package:presensi_mobile/utils/fonts_constant.dart';

class PresensiScreen extends StatefulWidget {
  const PresensiScreen({Key? key}) : super(key: key);

  @override
  _PresensiScreenState createState() => _PresensiScreenState();
}

class _PresensiScreenState extends State<PresensiScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundLightColor,
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return const ItemList();
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                child: Text("Datang"),
                padding: EdgeInsets.only(bottom: 8),
              ),
              Row(children: const [
                Icon(Icons.date_range_rounded, color: primaryLightColor),
                Padding(
                    child: Text("Tanggal 13-12-2019"),
                    padding: EdgeInsets.only(left: 8)),
              ])
            ],
          ),
          Positioned(
              right: 0,
              child: Container(width: 10, height: 50, color: Colors.green[100]))
        ]));
  }
}

class EmptyPresensi extends StatelessWidget {
  const EmptyPresensi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset('assets/icon/ic_empty.png', width: 100),
          const Text("Data belum ada presensi",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: FontMiliard,
                  color: Colors.black87)),
        ]);
  }
}
