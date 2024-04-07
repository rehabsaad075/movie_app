import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/searchBar_custom.dart';
import 'package:movie_app/view/componets/widget_custom/search_item_custom.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBarCustom(),
                  const SizedBox(height: 15,),
                  const Text(
                      'النتائج',
                    style: Styles.textStyle24,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20,),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context,index){
                         return  SearchItemCustom(
                           onTap: (){},
                         );
                        },
                        separatorBuilder: (context,index)=>const SizedBox(height: 15,),
                        itemCount: 10
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
