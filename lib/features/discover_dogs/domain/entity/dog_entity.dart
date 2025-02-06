import 'package:equatable/equatable.dart';

class DogEntity extends Equatable {
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

  const DogEntity({
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
  });

  DogEntity copyWith({
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
  }) =>
      DogEntity(
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
      );

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return '''
      DogEntity(
        id: $id,
        name: $name,
        breedGroup: $breedGroup,
        size: $size,
        lifespan: $lifespan,
        origin: $origin,
        temperament: $temperament,
        colors: $colors,
        description: $description,
        image: $image,
      )
    ''';
  }
}
