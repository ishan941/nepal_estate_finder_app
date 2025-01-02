import 'package:provider_with_clean_architecture/ets/user/domain/entities/post_entity.dart';

class PostModel extends PostResponseEntity {
  String? restaurantId;
  String? tableName;
  String? floor;
  int? tableNumber;
  int? numberOfSeats;

  PostModel(
      {this.restaurantId,
      this.tableName,
      this.floor,
      this.tableNumber,
      this.numberOfSeats})
      : super(
          restaurantId: restaurantId,
          tableName: tableName,
          floor: floor,
          tableNumber: tableNumber,
          numberOfSeats: numberOfSeats,
        );

  PostModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    tableName = json['tableName'];
    floor = json['floor'];
    tableNumber = json['tableNumber'];
    numberOfSeats = json['number_of_seats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['tableName'] = this.tableName;
    data['floor'] = this.floor;
    data['tableNumber'] = this.tableNumber;
    data['number_of_seats'] = this.numberOfSeats;
    return data;
  }
}
