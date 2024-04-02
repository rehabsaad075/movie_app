import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesStates> {
  SeriesCubit() : super(SeriesInitialState());
  static SeriesCubit get(context)=>BlocProvider.of(context);

  AllMoviesModel? allSeries;
  Future<void> getAllSeries() async {
    emit(GetAllSeriesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.discover}/${EndPoints.tv}',
    ).then((value) {
      allSeries=AllMoviesModel.fromJson(value.data);
      emit(GetAllSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetAllSeriesErrorState());
      }
    });
  }

  AllMoviesModel? trendingSeries;
  Future<void> getTrendingSeries() async {
    emit(GetTrendingSeriesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.trending}/${EndPoints.tv}/${EndPoints.timeWindow}',
    ).then((value) {
      trendingSeries=AllMoviesModel.fromJson(value.data);
      emit(GetTrendingSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetTrendingSeriesErrorState());
      }
    });
  }

  AllMoviesModel? ratingSeries;
  Future<void> getRatingSeries() async {
    emit(GetRatingSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.tv}',
        parameters: {
          'sort_by':'vote_average.desc'
        }
    ).then((value) {
      ratingSeries=AllMoviesModel.fromJson(value.data);
      emit(GetRatingSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetRatingSeriesErrorState());
      }
    });
  }

  bool hasMoreResults=true;
  Future<void> getMoreSeries() async {
    emit(GetMoreSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.tv}',
        parameters: {
          'page':(allSeries?.page??0)+1
        }
    ).then((value) {
      AllMoviesModel newSeriesModel=AllMoviesModel.fromJson(value.data);
      allSeries?.page=newSeriesModel.page;
      allSeries?.results?.addAll(newSeriesModel.results??[]);
      if(allSeries?.page==allSeries?.totalPages){
        hasMoreResults=false;
      }
      emit(GetMoreSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetMoreSeriesErrorState());
      }
    });
  }

  int currentSeriesIndex=0;
  void changeSeriesIndex(int seriesIndex){
    currentSeriesIndex=seriesIndex;
    emit(ChangeSeriesIndexState());
  }

  AllMoviesModel? similarSeries;
  Future<void> getSimilarSeries() async {
    emit(GetSimilarSeriesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.tv}/${allSeries?.results?[currentSeriesIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similarSeries=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarSeriesErrorState());
      }
    });
  }

  DetailsModel? detailsModel;
  Future<void> getDetailsSeries() async {
    emit(GetDetailsSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.tv}/${allSeries?.results?[currentSeriesIndex].id}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      detailsModel=DetailsModel.fromJson(value.data);
      emit(GetDetailsSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsSeriesErrorState());
      }
    });
  }
}

