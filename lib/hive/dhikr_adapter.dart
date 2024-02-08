

import '../models/dhikr.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DhikrAdapter extends TypeAdapter<Dhikr> {
  @override
  final int typeId = 0;


  @override
  Dhikr read(BinaryReader reader) {
    int counter = reader.readInt();
    String title = reader.readString();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    return Dhikr(counter: counter, title: title, date: date);
  }

  @override
  void write(BinaryWriter writer, Dhikr obj) {
    writer.writeInt(obj.counter);
    writer.writeString(obj.title);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
  }

}