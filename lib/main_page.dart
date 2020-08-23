import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indo_hackfest_app/about.dart';
import 'package:indo_hackfest_app/angkutan_barang_page.dart';
import 'package:indo_hackfest_app/angkutan_kota_page.dart';
import 'package:indo_hackfest_app/pelacakan.dart';
import 'package:indo_hackfest_app/services/auth_services.dart';
import 'package:indo_hackfest_app/services/database_services.dart';

class MainPage extends StatelessWidget {
  final FirebaseUser user;
  MainPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/batik.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text("Tentang Kami"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AboutPage();
                }));
              },
            ),
            ListTile(
              title: Text("Keluar"),
              onTap: () async {
                await AuthServices.SignOut();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Container(
          margin: EdgeInsets.only(right: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "becaku",
                style: GoogleFonts.pacifico().copyWith(fontSize: 28),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white10,
              ),
              child: Card(
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AngkutanBarangPage();
                    }));
                  },
                  splashColor: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/viar-karya.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 12,
                          color: Colors.white70,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text("Angkutan Barang",
                            style: GoogleFonts.lato().copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AngkutanKotaPage();
                    }));
                  },
                  splashColor: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/karya-angkot.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          "Angkutan Kota",
                          style: GoogleFonts.lato().copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    // DocumentSnapshot snapshot =
                    //     await DatabaseServices.getBarang("1");
                    // final String unit = snapshot.data['unit'];
                    // final String jenis = snapshot.data['jenis'];
                    // final String volume = snapshot.data['volume'];
                    // final String tujuan = snapshot.data['tujuan'];

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PelacakanPage();
                    }));
                  },
                  splashColor: Colors.white,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/tracking.jpg"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          "Pelacakan Operasi",
                          style: GoogleFonts.lato().copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
