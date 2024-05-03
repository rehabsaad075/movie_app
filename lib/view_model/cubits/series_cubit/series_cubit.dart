import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/functions/flutterToastFunctions.dart';
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
        endPoint: '${EndPoints.tv}/${EndPoints.topRated}',
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
  Future<void> getSimilarSeries({AllMoviesModel ?seriesModel}) async {
    emit(GetSimilarSeriesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.tv}/${seriesModel?.results?[currentSeriesIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similarSeries=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarSeriesErrorState());
      }
    });
  }

  DetailsModel? detailsSeries;
  Future<void> getDetailsSeries({AllMoviesModel ?seriesModel}) async {
    emit(GetDetailsSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.tv}/${seriesModel?.results?[currentSeriesIndex].id}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      detailsSeries=DetailsModel.fromJson(value.data);
      emit(GetDetailsSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsSeriesErrorState());
      }
    });
  }
  bool isFavorite=true;
  Future<void> addFavSeries()async {
    emit(AddFavSeriesLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}',
        body: {
          'media_type':'tv',
          'media_id':detailsSeries?.id,
          'favorite':isFavorite
        }
    ).then((value) {
      emit(AddFavSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(AddFavSeriesErrorState());
      }
    });
  }

  Future<void> deleteFavTv(int index)async {
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}',
        body: {
          'media_type':'tv',
          'media_id':favTv?.results?[index].id,
          'favorite':!isFavorite
        }
    ).then((value) {
      getFavTv();
      emit(DeleteFavSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(DeleteFavSeriesErrorState());
      }
    });
  }

  AllMoviesModel ?favTv;
  Future<void>getFavTv()async {
    emit(GetFavSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}/${EndPoints.tv}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      favTv=AllMoviesModel.fromJson(value.data);
      emit(GetFavSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetFavSeriesErrorState());
      }
    });
  }

  Future<void> addWatchedSeries()async {
    emit(AddWatchedSeriesLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}',
        body: {
          'media_type':'tv',
          'media_id':detailsSeries?.id,
          'watchlist':true
        }
    ).then((value) {
      emit(AddWatchedSeriesSuccessState());
      showToast(msg: 'تم اضافة هذا المسلسل الى قائمة المشاهدات');
    }).catchError((error){
      if(error is DioException){
        emit(AddWatchedSeriesErrorState());
      }
    });
  }

  Future<void> deleteWatchedTv(int index)async {
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}',
        body: {
          'media_type':'tv',
          'media_id':watchedTv?.results?[index].id,
          'watchlist':false
        }
    ).then((value) {
      getWatchedTv();
      emit(DeleteWatchedSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(DeleteWatchedSeriesErrorState());
      }
    });
  }

  AllMoviesModel ?watchedTv;
  Future<void>getWatchedTv()async {
    emit(GetWatchedSeriesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}/${EndPoints.tv}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      watchedTv=AllMoviesModel.fromJson(value.data);
      emit(GetWatchedSeriesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetWatchedSeriesErrorState());
      }
    });
  }
}

