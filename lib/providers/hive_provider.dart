import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/dhikr.dart';
import '../constanst/constants.dart';

class HiveProvider extends ChangeNotifier{
  late Box<Dhikr> box;

  Future<void> openDhikrBox() async {
    box = await Hive.openBox<Dhikr>(keyHiveDhikrBox);
  }
}