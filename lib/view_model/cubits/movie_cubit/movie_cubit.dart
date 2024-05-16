
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/models/reviews_model.dart';
import 'package:movie_app/models/watchProvidersModels.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/functions/flutterToastFunctions.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieAppInitialState());
  static MovieCubit get(context)=>BlocProvider.of(context);


  AllMoviesModel? allMoviesModel;
  Future<void> getAllMovies() async {
    emit(GetAllMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.movie}',
    ).then((value) {
      allMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetAllMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetAllMoviesErrorState());
      }
    });
  }

  AllMoviesModel? trendingMovies;
  Future<void> getTrendingMovies() async {
    emit(GetTrendingMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.trending}/${EndPoints.movie}/${EndPoints.timeWindow}',
    ).then((value) {
      trendingMovies=AllMoviesModel.fromJson(value.data);
      emit(GetTrendingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetTrendingMoviesErrorState());
      }
    });
  }

  AllMoviesModel? ratingMoviesModel;
  Future<void> getRatingMovies() async {
    emit(GetRatingMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${EndPoints.topRated}',
    ).then((value) {
      ratingMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetRatingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetRatingMoviesErrorState());
      }
    });
  }

bool hasMoreResults=true;
  Future<void> getMoreMovies() async {
    emit(GetMoreMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.movie}',
        parameters: {
          'page':(allMoviesModel?.page??0)+1
        }
    ).then((value) {
      AllMoviesModel newMoviesModel=AllMoviesModel.fromJson(value.data);
      allMoviesModel?.page=newMoviesModel.page;
      allMoviesModel?.results?.addAll(newMoviesModel.results??[]);
      if(allMoviesModel?.page==allMoviesModel?.totalPages){
        hasMoreResults=false;
      }
      emit(GetMoreMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetMoreMoviesErrorState());
      }
    });
  }

  int currentMovieIndex=0;
  void changeMovieIndex(int movieIndex){
    currentMovieIndex=movieIndex;
    emit(ChangeMovieIndexState());
  }

  AllMoviesModel? similarMovies;
  Future<void> getSimilarMovies({ AllMoviesModel ?movieId}) async {
    emit(GetSimilarMoviesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${movieId?.results?[currentMovieIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similarMovies=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarMoviesErrorState());
      }
    });
  }

  DetailsModel? detailsMovie;
  Future<void> getDetailsMovie({ AllMoviesModel ?movieId}) async {
    emit(GetDetailsMovieLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${movieId?.results?[currentMovieIndex].id}',
      parameters: {
        'language':'ar'
      }
    ).then((value) {
      detailsMovie=DetailsModel.fromJson(value.data);
      emit(GetDetailsMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsMovieErrorState());
      }
    });
  }

  DetailsModel? detailsMovieHomePage;
  Future<void>getDetailsMovieHomePage()async {
   emit(GetDetailsMovieHomePageLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${detailsMovie?.id}',
    ).then((value) {
      detailsMovieHomePage=DetailsModel.fromJson(value.data);
      emit(GetDetailsMovieHomePageSuccessState());
    }).catchError((error){
      emit(GetDetailsMovieHomePageErrorState());
    });
  }


 bool isFavorite=false;
  Future<void> addFavMovie()async {
    emit(AddFavMovieLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}',
      body: {
          'media_type':'movie',
          'media_id':detailsMovie?.id,
          'favorite':!isFavorite
      }
    ).then((value) {
      emit(AddFavMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(AddFavMovieErrorState());
      }
    });
  }

  Future<void> deleteFavMovie(int index)async {
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}',
        body: {
          'media_type':'movie',
          'media_id':favMovie?.results?[index].id,
          'favorite':isFavorite
        }
    ).then((value) {
      getFavMovie();
      emit(DeleteFavMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(DeleteFavMovieErrorState());
      }
    });
  }

  void changeFavMovie(){
    isFavorite=!isFavorite;
    if(isFavorite==true){
      addFavMovie();
      //isFavorite=!isFavorite;
    }else{
      DioHelper.post(
          endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}',
          body: {
            'media_type':'movie',
            'media_id':detailsMovie?.id,
            'favorite':isFavorite
          }
      ).then((value) {
        //isFavorite=!isFavorite;
        emit(DeleteFavMovieSuccessState());
      }).catchError((error){
        if(error is DioException){
          emit(DeleteFavMovieErrorState());
        }
      });
    }
    emit(ChangeFavMovieState());
  }

  AllMoviesModel ?favMovie;
  Future<void>getFavMovie()async {
    emit(GetFavMovieLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.favorite}/${EndPoints.movies}',
      parameters: {
        'language':'ar'
      }
    ).then((value) {
      favMovie=AllMoviesModel.fromJson(value.data);
      emit(GetFavMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetFavMovieErrorState());
      }
    });
  }


  Future<void> addWatchedMovie()async {
    emit(AddWatchedMovieLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}',
        body: {
          'media_type':'movie',
          'media_id':detailsMovie?.id,
          'watchlist':true
        }
    ).then((value) {
      emit(AddWatchedMovieSuccessState());
      showToast(msg: 'تم اضافة هذا الفيلم الى قائمة المشاهدات');
    }).catchError((error){
      if(error is DioException){
        emit(AddWatchedMovieErrorState());
      }
    });
  }

  Future<void> deleteWatchedMovie(int index)async {
    await DioHelper.post(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}',
        body: {
          'media_type':'movie',
          'media_id':watchedMovie?.results?[index].id,
          'watchlist':false
        }
    ).then((value) {
      getWatchedMovie();
    emit(DeleteWatchedMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(DeleteWatchedMovieErrorState());
      }
    });
  }

  AllMoviesModel ?watchedMovie;
  Future<void>getWatchedMovie()async {
    emit(GetWatchedMovieLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.account}/21091525/${EndPoints.watchList}/${EndPoints.movies}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      watchedMovie=AllMoviesModel.fromJson(value.data);
      emit(GetWatchedMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetWatchedMovieErrorState());
      }
    });
  }
  WatchProviderModel ? watchProviderModel;
  Future<void>getWatchProvidersMovie()async {
    emit(GetWatchProvidersMovieLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${detailsMovie?.id}/${EndPoints.watch}/${EndPoints.providers}'
    ).then((value) {
      watchProviderModel=WatchProviderModel.fromJson(value.data);
      emit(GetWatchProvidersMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetWatchProvidersMovieErrorState());
      }
    });
  }
  TextEditingController controller=TextEditingController();
  Future<void>addRatingMovie()async {
    emit(AddRatingMovieLoadingState());
    await DioHelper.post(
        endPoint: '${EndPoints.movie}/${detailsMovie?.id}/${EndPoints.rating}',
      body: {
          'value':controller.text
      }
    ).then((value) {
      controller.clear();
      showToast(msg: 'تم اضافة هذا التقييم بنجاح');
      emit(AddRatingMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(AddRatingMovieErrorState());
      }
    });
  }

  ReviewsModel ?reviewsMovie;
  Future<void>getReviewsMovie()async {
    emit(GetReviewsMovieLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${detailsMovie?.id}/${EndPoints.reviews}'
    ).then((value) {
      reviewsMovie=ReviewsModel.fromJson(value.data);
      emit(GetReviewsMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetReviewsMovieErrorState());
      }
    });
  }
  // Future<void> launchUrl(String url) async {
  //    Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(url);
  //   }
  // }
}
