import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'dog_entity.g.dart';

@HiveType(typeId: 1)
class DogEntity extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? breedGroup;
  @HiveField(3)
  final String? size;
  @HiveField(4)
  final String? lifespan;
  @HiveField(5)
  final String? origin;
  @HiveField(6)
  final String? temperament;
  @HiveField(7)
  final List<String>? colors;
  @HiveField(8)
  final String? description;
  @HiveField(9)
  final String? image;
  @HiveField(10)
  final bool isBookmarked;

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
    this.isBookmarked = false,
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
    bool isBookmarked = false,
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
        isBookmarked: isBookmarked,
      );

  @override
  List<Object?> get props => [id];

  @override
  bool? get stringify => true;
}
