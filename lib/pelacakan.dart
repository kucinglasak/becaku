import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:indo_hackfest_app/services/database_services.dart';

class PelacakanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pelacakan Operasi"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      "Angkutan Barang",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Unit: "),
                            StreamBuilder(
                              stream: Firestore.instance
                                  .collection('barangCollection')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                // if (snapshot.hasError) {
                                //   return Text('Error: ${snapshot.error}');
                                // } else if (!snapshot.hasData) {
                                //   return Text("No data");
                                // } else {
                                //   return Text(snapshot.data['unit']);
                                // }
                                return Text("Karya 200");
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Jenis: "),
                            Text("sparepart"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Volume: "),
                            Text("5 kg"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Tujuan: "),
                            Text("Helvetia"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Ongkos: "),
                            Text("Rp 35.000"),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      "Angkutan Kota",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Unit: "),
                            Text("Karya 200"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Penumpang:"),
                            Text("5 orang"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Tujuan: "),
                            Text("Belawan"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Ongkos: "),
                            Text("Rp 50.000"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
