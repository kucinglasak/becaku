import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indo_hackfest_app/services/auth_services.dart';
import 'package:indo_hackfest_app/login_page.dart';
import 'package:indo_hackfest_app/wrapper.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
