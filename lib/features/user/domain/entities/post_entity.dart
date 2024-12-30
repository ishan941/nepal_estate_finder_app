import 'package:equatable/equatable.dart';

class PostResponseEntity extends Equatable {
 String? restaurantId;
  String? tableName;
  String? floor;
  int? tableNumber;
  int? numberOfSeats;

   PostResponseEntity(
      {this.restaurantId, this.tableName, this.floor,this.tableNumber, this.numberOfSeats});

  @override
  List<Object?> get props => [tableName, floor, numberOfSeats,tableNumber, restaurantId];
}
