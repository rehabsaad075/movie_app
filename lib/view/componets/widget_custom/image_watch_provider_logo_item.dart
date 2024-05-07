import 'package:flutter/material.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
class ImageWatchProviderLogoItem extends StatelessWidget {
  final String logoPath;
  const ImageWatchProviderLogoItem({super.key, required this.logoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
            image: NetworkImage(
              '${EndPoints.imageUrl}$logoPath'
            ),
          fit: BoxFit.fill
        )
      ),
    );
  }
}
