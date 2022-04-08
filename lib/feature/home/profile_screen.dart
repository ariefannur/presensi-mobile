import 'package:flutter/material.dart';
import 'package:presensi_mobile/utils/color.dart';
import 'package:presensi_mobile/utils/fonts_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundLightColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                      blurRadius: 10)
                ]),
            child: const Center(
                child:
                    Icon(Icons.person, color: backgroundLightColor, size: 80)),
          ),
          const ItemProfile(),
          ItemProfile(),
        ],
      ),
    );
  }
}

class ItemProfile extends StatelessWidget {
  const ItemProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: const [
          Icon(Icons.person, color: primaryLightColor),
          SizedBox(
            width: 16,
          ),
          Text(
            'Nama Lengkap',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontMiliard,
              color: primaryLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
