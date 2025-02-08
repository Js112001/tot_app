import 'dart:convert';

import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

DogModel dogModelFromJson(String str) =>
    DogModel.fromJson(json.decode(str).map((x) => DogModel.fromJson(x)));

String dogModelToJson(List<DogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DogModel extends DogEntity {
  final int? id;
  final String? name;
  final String? breedGroup;
  final String? size;
  final String? lifespan;
  final String? origin;
  final String? temperament;
  final List<String>? colors;
  final String? description;
  final String? image;
  final bool isBookmarked;

  const DogModel({
    this.id,
    this.name,
    this.breedGroup,
    this.size,
    this.lifespan,
    this.origin,
    this.temperament,
    this.colors,
    this.description,
    this.image,
    this.isBookmarked = false,
  }) : super(
          id: id,
          name: name,
          breedGroup: breedGroup,
          size: size,
          lifespan: lifespan,
          origin: origin,
          temperament: temperament,
          colors: colors,
          description: description,
          image: image,
          isBookmarked: isBookmarked,
        );

  @override
  DogModel copyWith({
    int? id,
    String? name,
    String? breedGroup,
    String? size,
    String? lifespan,
    String? origin,
    String? temperament,
    List<String>? colors,
    String? description,
    String? image,
    bool isBookmarked = false,
  }) =>
      DogModel(
        id: id ?? this.id,
        name: name ?? this.name,
        breedGroup: breedGroup ?? this.breedGroup,
        size: size ?? this.size,
        lifespan: lifespan ?? this.lifespan,
        origin: origin ?? this.origin,
        temperament: temperament ?? this.temperament,
        colors: colors ?? this.colors,
        description: description ?? this.description,
        image: image ?? this.image,
        isBookmarked: isBookmarked,
      );

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        id: json["id"],
        name: json["name"],
        breedGroup: json["breed_group"],
        size: json["size"],
        lifespan: json["lifespan"],
        origin: json["origin"],
        temperament: json["temperament"],
        colors: json["colors"] == null
            ? []
            : List<String>.from(json["colors"]!.map((x) => x)),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "breed_group": breedGroup,
        "size": size,
        "lifespan": lifespan,
        "origin": origin,
        "temperament": temperament,
        "colors":
            colors == null ? [] : List<dynamic>.from(colors!.map((x) => x)),
        "description": description,
        "image": image,
      };
}
