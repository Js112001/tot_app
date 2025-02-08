import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tot_app/features/discover_dogs/domain/entity/dog_entity.dart';

class DogInfoCard extends StatelessWidget {
  const DogInfoCard({
    super.key,
    required this.dogEntity,
    required this.onBookmarkClick,
  });

  final DogEntity dogEntity;
  final VoidCallback onBookmarkClick;

  @override
  Widget build(BuildContext context) {
    // if (dogEntity.isBookmarked) {
    //   AppLogger.i('[Entity]: $dogEntity');
    // }
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: CachedNetworkImage(
                imageUrl: dogEntity.image ?? '',
                errorWidget: (context, url, error) {
                  return Container(
                    width: 40,
                    height: 60,
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 15,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${dogEntity.name}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'BreedGroup: ${dogEntity.breedGroup}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Lifespan: ${dogEntity.lifespan}',
                      style: TextStyle(
                        backgroundColor: Colors.green.withValues(alpha: 0.4),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: onBookmarkClick,
                icon: dogEntity.isBookmarked
                    ? Icon(Icons.bookmark)
                    : Icon(Icons.bookmark_border),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
