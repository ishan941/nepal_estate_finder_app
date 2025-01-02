import 'package:equatable/equatable.dart';

class StudentResponseEntity extends Equatable {
  final String? name;
  final String? address;
  final String? contactNumber;
  final String? gender;

  const StudentResponseEntity(
      {this.name, this.address, this.contactNumber, this.gender});

  @override
  List<Object?> get props => [name, address, contactNumber, gender];
}
