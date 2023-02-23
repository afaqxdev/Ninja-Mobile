class AppleModel {
  List<Apple>? apple;

  AppleModel({this.apple});

  AppleModel.fromJson(Map<String, dynamic> json) {
    if (json['apple'] != null) {
      apple = <Apple>[];
      json['apple'].forEach((v) {
        apple!.add(new Apple.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.apple != null) {
      data['apple'] = this.apple!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Apple {
  int? id;
  String? name;
  int? price;
  String? image;
  String? battery;
  String? released;
  String? oS;
  String? chipset;
  String? resolution;
  String? memory;
  String? ram;
  String? cammera;
  String? selfieCammera;
  String? sensors;
  String? description;

  Apple(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.battery,
      this.released,
      this.oS,
      this.chipset,
      this.resolution,
      this.memory,
      this.ram,
      this.cammera,
      this.selfieCammera,
      this.sensors,
      this.description});

  Apple.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    battery = json['battery'];
    released = json['released'];
    oS = json['OS'];
    chipset = json['Chipset'];
    resolution = json['resolution'];
    memory = json['memory'];
    ram = json['ram'];
    cammera = json['cammera'];
    selfieCammera = json['selfie_cammera'];
    sensors = json['Sensors'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['battery'] = this.battery;
    data['released'] = this.released;
    data['OS'] = this.oS;
    data['Chipset'] = this.chipset;
    data['resolution'] = this.resolution;
    data['memory'] = this.memory;
    data['ram'] = this.ram;
    data['cammera'] = this.cammera;
    data['selfie_cammera'] = this.selfieCammera;
    data['Sensors'] = this.sensors;
    data['description'] = this.description;
    return data;
  }
}

class SamsungModel {
  List<Samsung>? samsung;

  SamsungModel({this.samsung});

  SamsungModel.fromJson(Map<String, dynamic> json) {
    if (json['samsung'] != null) {
      samsung = <Samsung>[];
      json['samsung'].forEach((v) {
        samsung!.add(new Samsung.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.samsung != null) {
      data['samsung'] = this.samsung!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Samsung {
  int? id;
  String? name;
  int? price;
  String? image;
  String? battery;
  String? released;
  String? oS;
  String? chipset;
  String? memory;
  String? resolution;
  String? ram;
  String? cammera;
  String? selfieCammera;
  String? sensors;

  Samsung(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.battery,
      this.released,
      this.oS,
      this.chipset,
      this.memory,
      this.resolution,
      this.ram,
      this.cammera,
      this.selfieCammera,
      this.sensors});

  Samsung.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    battery = json['battery'];
    released = json['released'];
    oS = json['OS'];
    chipset = json['Chipset'];
    memory = json['memory'];
    resolution = json['resolution'];
    ram = json['ram'];
    cammera = json['cammera'];
    selfieCammera = json['selfie_cammera'];
    sensors = json['Sensors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['battery'] = this.battery;
    data['released'] = this.released;
    data['OS'] = this.oS;
    data['Chipset'] = this.chipset;
    data['memory'] = this.memory;
    data['resolution'] = this.resolution;
    data['ram'] = this.ram;
    data['cammera'] = this.cammera;
    data['selfie_cammera'] = this.selfieCammera;
    data['Sensors'] = this.sensors;
    return data;
  }
}
