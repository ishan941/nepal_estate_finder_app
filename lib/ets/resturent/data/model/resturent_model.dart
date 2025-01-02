import 'dart:convert';

import 'package:provider_with_clean_architecture/ets/resturent/domain/entities/resturent_entities.dart';

ResturentModel resturentResponseModelFromJson(dynamic json) =>
    ResturentModel.fromJson(json.decode(json));

String resturentResponseModelToJson(ResturentModel data) =>
    json.encode(data.toJson());

List<ResturentModel> resturentModelListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => ResturentModel.fromJson(json)).toList();
}

class ResturentModel extends ResturentResponseEntity {
  String? restaurant_id;
  String? tableName;
  String? floor;
  String? table_id;
  int? tableNumber;
  int? numberOfSeats;

  ResturentModel(
      {this.restaurant_id,
      this.tableName,
      this.floor,
      this.table_id,
      this.tableNumber,
      this.numberOfSeats})
      : super(
            restaurantId: restaurant_id,
            tableName: tableName,
            floor: floor,
            table_id: table_id,
            tableNumber: tableNumber,
            numberOfSeats: numberOfSeats);

  ResturentModel.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    tableName = json['tableName'];
    floor = json['floor'];
    table_id = json['table_id'];
    tableNumber = json['tableNumber'];
    numberOfSeats = json['numberOfSeats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['tableName'] = this.tableName;
    data['floor'] = this.floor;
    data['table_id'] = this.table_id;
    data['tableNumber'] = this.tableNumber;
    data['numberOfSeats'] = this.numberOfSeats;
    return data;
  }
}
