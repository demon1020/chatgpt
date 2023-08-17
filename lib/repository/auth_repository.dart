import 'package:dartz/dartz.dart';

import '../core.dart';

class AuthRepository {
  static final BaseApiServices _apiServices = NetworkApiService();

  Future<Either<AppException, UserModel>>login(dynamic data) async {
    return await _apiServices.callPostAPI(
        AppUrl.login, {}, Parser.parseLogInResponse,
        body: data, disableTokenValidityCheck: true);
  }
}
