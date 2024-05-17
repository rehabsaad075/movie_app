import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/rating_item_custom.dart';

class RatingTvScreen extends StatelessWidget {
  const RatingTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return const RatingItemCustom(
              text: 'تقييم المسلسل',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10,);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
