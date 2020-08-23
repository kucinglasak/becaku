import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:indo_hackfest_app/services/database_services.dart';

class AngkutanBarangPage extends StatefulWidget {
  @override
  _AngkutanBarangPageState createState() => _AngkutanBarangPageState();
}

class _AngkutanBarangPageState extends State<AngkutanBarangPage> {
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
    TextEditingController jenisController = TextEditingController();
    TextEditingController volumeController = TextEditingController();
    TextEditingController tujuanController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Angkutan Barang"),
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
                    controller: jenisController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Jenis Barang",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: volumeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Volume Barang (kg)",
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
                      DatabaseServices.createOrUpdateBarang(
                          Firestore.instance.collection('barangCollection').id,
                          unit: selectedUnit.type,
                          jenis: jenisController.text,
                          volume: volumeController.text,
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
