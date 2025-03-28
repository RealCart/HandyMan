import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/data/models/signin_req_params.dart';
import 'package:handy_man/service_locator.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signup_req_params.dart';

abstract class AuthApiService {
  Future<Either> signUp(SignupReqParams signupReq);
  Future<Either> signIn(SigninReqParams signinReq);
}

class AuthApiServiceImp extends AuthApiService {
  @override
  Future<Either> signUp(SignupReqParams signupReq) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.userSignUp, data: signupReq.toMap());
      print("Sucessfully: ${response.data}");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', response.data['id']);
      return Right(response);
    } on DioException catch (error) {
      print(">>>>>>>>>>>>>>>>>>>>>>> Error catched while signUp: $error");
      if (error.response != null) {
        return Left(error.response!.data);
      } else {
        return const Left('Не удалось получить ответ от сервера');
      }
    }
  }

  @override
  Future<Either> signIn(SigninReqParams signinReq) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.userLogin, data: signinReq.toMap());
      print("Successfully: $response");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('userId', response.data['id'].toString());
      return Right(response);
    } on DioException catch (error) {
      print(">>>>>>>>>>>>>>>>>>>>>>> Error catched while signIn: $error");
      if (error.response != null) {
        return Left(error.response!.data);
      } else {
        return const Left('Не удалось получить ответ от сервера');
      }
    }
  }
}
