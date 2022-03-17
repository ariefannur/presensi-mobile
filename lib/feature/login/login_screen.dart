import 'package:flutter/material.dart';
import 'package:presensi_mobile/data/remote/remote_auth.dart';
import 'package:presensi_mobile/data/repository/auth_repository.dart';
import 'package:presensi_mobile/data/repository/user_repository.dart';
import 'package:presensi_mobile/feature/home/home_screen.dart';
import 'package:presensi_mobile/utils/fonts_constant.dart';
import 'package:presensi_mobile/feature/login/change_password_screen.dart';
import 'package:presensi_mobile/utils/loging.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
        body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: FontMiliard,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'ID',
                      hintStyle: TextStyle(
                        color: Colors.blue[900],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.blue[900],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16)),
                      onPressed: () {
                        //_homeScreen(context);
                        _doLogin();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _changePassword(context);
                    },
                    child: const Text(
                      "Change Password",
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: FontMiliard,
                          fontSize: 16),
                    ),
                  )
                ])));
  }

  _doLogin() {
    // final authRepository = AuthRepository(RemoteAuth(), UserRepository());
    // authRepository.login(username: 'admin', password: 'admin');
  }

  _getSession() {
    // AuthRepository(RemoteAuth(), UserRepository()).getUserSession().then((value) {
    //   //if (value != null) {
    //   loging("session " + value.token);
    //   //}
    // });
  }

  _changePassword(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
  }

  _homeScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
