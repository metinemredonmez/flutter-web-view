import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final CollectionReference devicesCollection =
  FirebaseFirestore.instance.collection('devices');

  // final CollectionReference colorsCollection =
  // FirebaseFirestore.instance.collection('colors');

  Future<void> saveDeviceId(String deviceId) async {
    try {
      await devicesCollection.doc(deviceId).set({'deviceId': deviceId});
    } catch (e) {
      print('Error saving device ID: $e');
    }
  }

  Future<void> saveToken(String deviceId, String token) async {
    try {
      await devicesCollection.doc(deviceId).update({'deviceToken': token});
    } catch (e) {
      print('Error saving token: $e');
    }
  }

  // Future<Color?> getPrimaryColor() async {
  //   try {
  //     final DocumentSnapshot snapshot =
  //     await colorsCollection.doc('primary').get();
  //     final dynamic colorData = snapshot.data();
  //     if (colorData != null && colorData['value'] != null) {
  //       final int colorValue = colorData['value'];
  //       return Color(colorValue);
  //     }
  //   } catch (e) {
  //     print('Error getting primary color: $e');
  //   }
  //   return null;
  // }
  //
  // Future<void> updatePrimaryColor(Color newColor) async {
  //   try {
  //     await colorsCollection.doc('primary').set({'value': newColor.value});
  //   } catch (e) {
  //     print('Error updating primary color: $e');
  //   }
  // }
}
