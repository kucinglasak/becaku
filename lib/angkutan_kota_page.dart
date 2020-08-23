import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'services/database_services.dart';

class AngkutanKotaPage extends StatefulWidget {
  @override
  _AngkutanKotaPageState createState() => _AngkutanKotaPageState();
}

class _AngkutanKotaPageState extends State<AngkutanKotaPage> {
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();

  Unit selectedUnit;

  List<Unit> units = [Unit("Karya 200"), Unit("Karya 300")];

  List<DropdownMenuItem> generateItems(List<Unit> units) {
    List<DropdownMenuItem> items = [];
    for (var item in units) {
      items.add(DropdownMenuItem(
        child: Text(item.type),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Angkutan Kota"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  DropdownButton(
                    hint: Text("Unit Becak"),
                    isExpanded: true,
                    value: selectedUnit,
                    items: generateItems(units),
                    onChanged: (item) {
                      setState(() {
                        selectedUnit = item;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: jumlahController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Jumlah Penumpang",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: tujuanController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Tujuan",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      DatabaseServices.createOrUpdateKota(
                          Firestore.instance.collection('kotaCollection').id,
                          unit: selectedUnit.type,
                          jumlah: jumlahController.text,
                          tujuan: tujuanController.text);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Unit {
  String type;
  Unit(this.type);
}
