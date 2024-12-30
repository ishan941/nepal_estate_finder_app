import 'package:equatable/equatable.dart';

class ResturentResponseEntity extends Equatable {
  String? restaurantId;
  String? tableName;
  String? floor;
  String? table_id;
  int? tableNumber;
  int? numberOfSeats;

   ResturentResponseEntity(
      {this.floor,this.numberOfSeats,this.restaurantId, this.tableName,this.tableNumber,
      this.table_id,
      });

  @override
  List<Object?> get props => [restaurantId, tableName,floor,tableNumber,numberOfSeats];
}
