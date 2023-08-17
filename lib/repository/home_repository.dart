import 'package:chatgpt/core.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends NetworkApiService{

  // final BaseApiServices _apiServices = NetworkApiService() ;

  Future<Either<AppException, MovieListModel>> fetchMoviesList() async {
    return await callGetAPI(
        AppUrl.moviesListEndPoint, {}, Parser.fetchMoviesList,disableTokenValidityCheck: true);
  }
}