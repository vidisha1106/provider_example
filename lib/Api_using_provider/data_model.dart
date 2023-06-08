// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);
import 'dart:convert';

class PetModel {
  final int id;
  final String userName;
  final String petName;
  final String petImage;
  final bool isFriendly;

  PetModel({
    required this.id,
    required this.userName,
    required this.petName,
    required this.petImage,
    required this.isFriendly,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
    id: json["id"],
    userName: json["userName"],
    petName: json["petName"],
    petImage: json["petImage"],
    isFriendly: json["isFriendly"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "petName": petName,
    "petImage": petImage,
    "isFriendly": isFriendly,
  };
}
