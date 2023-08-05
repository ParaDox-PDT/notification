import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demologin/presentation/pages/home.dart';
import 'package:demologin/presentation/pages/no_internet.dart';
import 'package:demologin/service/notification_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == ConnectivityResult.mobile ||
              snapshot.data == ConnectivityResult.wifi) {
            return HomePage();
          } else if (snapshot.data == ConnectivityResult.none) {
            return NoInternetPage();
          } else {
            return Text('data');
          }
        } else {
          return Scaffold(
            body: Center(
              child: Text(''),
            ),
          );
        }
      },
    );
  }
}
