import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';

class AllMoviesSection extends StatelessWidget {
  const AllMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height * .22,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return const ImageCustom();
          },
          separatorBuilder: (context,index)=>const SizedBox(width:15,),
          itemCount: 10
      ),
    );
  }
}
