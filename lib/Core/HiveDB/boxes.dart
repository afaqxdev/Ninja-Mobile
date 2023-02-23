import 'package:Ninja/Core/HiveDB/model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<ModelHive> getData() => Hive.box<ModelHive>('Cart');
}

class BoxesFavourite {
  static Box<ModelHive> getData() => Hive.box<ModelHive>('favourite');
}
