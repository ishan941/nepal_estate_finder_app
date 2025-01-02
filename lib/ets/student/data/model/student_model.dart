import 'dart:convert';
import 'package:provider_with_clean_architecture/ets/student/domain/entities/student_response_entity.dart';

StudentModel studentResponseModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentResponseModelToJson(StudentModel data) =>
    json.encode(data.toJson());

List<StudentModel> studentModelListFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => StudentModel.fromJson(json)).toList();
}

class StudentModel extends StudentResponseEntity {
  String? name;
  String? address;
  String? contactNumber;
  String? gender;

  StudentModel({
    this.name,
    this.address,
    this.contactNumber,
    this.gender,
  }) : super(
            name: name,
            address: address,
            contactNumber: contactNumber,
            gender: gender);

  StudentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    contactNumber = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.contactNumber;
    data['gender'] = this.gender;
    return data;
  }
}
