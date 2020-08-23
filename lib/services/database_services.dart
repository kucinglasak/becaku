import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference barangCollection =
      Firestore.instance.collection("angkutan_barang");
  static CollectionReference kotaCollection =
      Firestore.instance.collection("angkutan_kota");

  static Future<void> createOrUpdateBarang(String id,
      {String unit, String jenis, String volume, String tujuan}) async {
    await barangCollection.document(id).setData({
      'unit': unit,
      'jenis': jenis,
      'volume': volume,
      'tujuan': tujuan,
    });
  }

  static Future<int> getBarangCount() async {
    var resp = await barangCollection.getDocuments().then((value) {
      return value.documents.length;
    });

    return resp;
  }

  static Future<DocumentSnapshot> getBarang(String id) async {
    return await barangCollection.document(id).get();
  }

  static Future<void> createOrUpdateKota(String id,
      {String unit, String jumlah, String tujuan}) async {
    await kotaCollection.document(id).setData({
      'unit': unit,
      'jumlah': jumlah,
      'tujuan': tujuan,
    });
  }

  static Future<DocumentSnapshot> getKota(String id) async {
    return await kotaCollection.document(id).get();
  }
}
