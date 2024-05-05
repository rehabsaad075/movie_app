import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/image_watch_provider_logo_item.dart';

class RentMovieList extends StatelessWidget {
  const RentMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.08,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return const ImageWatchProviderLogoItem();
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 10,),
          itemCount: 3
      ),
    );
  }
}
