import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indo_hackfest_app/services/auth_services.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(24),
                child: Text("becaku",
                    style: GoogleFonts.pacifico().copyWith(
                      color: Colors.white,
                      fontSize: 60,
                    )),
              ),
              Container(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  await AuthServices.SignIn(
                      emailController.text, passwordController.text);
                },
                color: Colors.blue,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
