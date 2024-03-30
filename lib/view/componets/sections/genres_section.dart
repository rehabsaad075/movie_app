import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/circleContainer_custom.dart';

class GenresSection extends StatelessWidget {
  const GenresSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
          return const CircleContainerCustom();
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 15,),
          itemCount: 5
      ),
    );
  }
}
