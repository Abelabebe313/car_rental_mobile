class CarModel {
  String? id;
  String? name;
  String? model;
  num? price;
  num? rate;
  int? seat;
  String? type;
  String? image;
  String? description;

  CarModel(
      {this.id,
      this.name,
      this.model,
      this.price,
      this.rate,
      this.seat,
      this.type,
      this.image,
      this.description});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    model = json['model'];
    price = json['price'];
    rate = json['rate'];
    seat = json['seat'];
    type = json['type'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['model'] = this.model;
    data['price'] = this.price;
    data['rate'] = this.rate;
    data['seat'] = this.seat;
    data['type'] = this.type;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}
