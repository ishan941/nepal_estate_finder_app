class MenuModel {
  String? name;
  String? category;
  int? price;
  int? cookingTime;
  String? description;
  String? photo;

  MenuModel(
      {this.name,
      this.category,
      this.price,
      this.cookingTime,
      this.description,
      this.photo});

  MenuModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    price = json['price'];
    cookingTime = json['cookingTime'];
    description = json['description'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['price'] = this.price;
    data['cookingTime'] = this.cookingTime;
    data['description'] = this.description;
    data['photo'] = this.photo;
    return data;
  }
}
