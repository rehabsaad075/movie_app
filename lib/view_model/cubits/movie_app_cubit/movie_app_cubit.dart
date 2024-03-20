import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_app_state.dart';

class MovieAppCubit extends Cubit<MovieAppStates> {
  MovieAppCubit() : super(MovieAppInitialState());
  static MovieAppCubit get(context)=>BlocProvider.of(context);
}
