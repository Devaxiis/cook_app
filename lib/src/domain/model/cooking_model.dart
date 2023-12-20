
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class CookingModel{
  int? id;
  String? name;
  String? description;
  double? time;
  String? imageUrl;

  CookingModel({
    required this.id,
    required this.name,
    required this.description,
    required this.time,
    required this.imageUrl,
  });

  factory CookingModel.fromJson(Map<String, Object?> json) => CookingModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    time: json['time'] as double?,
    imageUrl: json['imageUrl'] as String?,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
  };

  @override
  String toString() {
    return "CookingModel{id: $id, name: $name, description: $description,time: $time , imageUrl: $imageUrl}";
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CookingModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => Object.hash(id, name);

}
// part 'cooking_model.g.dart';
//
// @JsonSerializable()
// class CookingModel{
//   int id;
//   String name;
//   String description;
//   String imageUrl;
//
//   CookingModel({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.imageUrl,
// });
//
//   factory CookingModel.fromJson(Map<String, Object?> json) => _$CookingModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CookingModelToJson(this);
// }