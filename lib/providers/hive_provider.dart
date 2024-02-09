import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/dhikr.dart';
import '../constanst/constants.dart';

class HiveProvider extends ChangeNotifier{
  late Box<Dhikr> box;

  Future<void> openDhikrBox() async {
    box = await Hive.openBox<Dhikr>(keyHiveDhikrBox);
  }

  void editDhikr(int index, String title) {
    final counter = box.getAt(index)?.counter ?? 0;

    box.putAt(
      index, Dhikr(
        counter: counter,
        title: title,
        date: DateTime.now(),
      ),
    );
  }

  void deleteDhikr(int index) {
    box.deleteAt(index);
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}