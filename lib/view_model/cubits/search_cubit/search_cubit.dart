import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context)=>BlocProvider.of(context);

  AllMoviesModel ?allResults;
  Future<void>searchOfResults({required String movieName})async {
    emit(SearchLoadingState());
    await DioHelper.get(
        endPoint: EndPoints.search,
        parameters: {
          'query':movieName
        }
    ).then((value) {
      allResults=AllMoviesModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(SearchErrorState());
      }
    });
  }

  int currentIndex=0;
  void changeIndex(int resultIndex){
    currentIndex=resultIndex;
    emit(ChangeIndexState());
  }

  AllMoviesModel? similar;
  Future<void> getSimilar() async {
    emit(GetSimilarSearchLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${allResults?.results?[currentIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similar=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarSearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarSearchErrorState());
      }
    });
  }

  DetailsModel? detailsModel;
  Future<void> getDetails() async {
    emit(GetDetailsSearchLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${allResults?.results?[currentIndex].id}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      detailsModel=DetailsModel.fromJson(value.data);
      emit(GetDetailsSearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsSearchErrorState());
      }
    });
  }
}
