import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class ModelHive extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String price;
  @HiveField(3)
  String totalprice;
  @HiveField(4)
  int quantity;
  @HiveField(5)
  String images;

  ModelHive(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.totalprice,
      required this.images});
}
