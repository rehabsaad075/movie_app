import 'package:flutter/material.dart';

class ImageWatchProviderLogoItem extends StatelessWidget {
  const ImageWatchProviderLogoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: const DecorationImage(
            image: NetworkImage('https://image.tmdb.org/t/p/w500/97yvRBw1GzX7fXprcF80er19ot.jpg'),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
