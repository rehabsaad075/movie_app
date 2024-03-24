import 'package:flutter/material.dart';

class ImageCustom extends StatelessWidget {
  const ImageCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2/3,
      child: Container(
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
                ),
              fit: BoxFit.fill
            ),
        ),
      ),
    );
  }
}
