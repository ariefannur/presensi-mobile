import 'package:flutter/material.dart';
import 'package:presensi_mobile/data/di.dart';
import 'package:presensi_mobile/data/repository/auth_repository.dart';
import 'package:presensi_mobile/feature/home/home_screen.dart';
import 'package:presensi_mobile/utils/fonts_constant.dart';
import 'package:presensi_mobile/feature/login/change_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authRepositoryImpl.getController().listen((event) {
      if (event == AuthenticationStatus.unknown) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("Server tidak tersedia"),
                  actions: [
                    FlatButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ));
      }
    });
  }

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
                    controller: usernameController,
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
                    controller: passwordController,
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
    authRepositoryImpl.login(
        username: usernameController.value.text,
        password: passwordController.value.text);
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
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
