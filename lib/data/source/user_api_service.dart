import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:handy_man/data/models/user_info.dart';

abstract class UserApiService {
  Future<Either> getUser();
}

class UserApiServiceImpl extends UserApiService {
  @override
  Future<Either> getUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final userId = sharedPreferences.getString("userId");
      print(">>>>>>>>>>>>> User id from sharedPreferences: $userId");
      var response = await sl<DioClient>().get('${ApiUrls.getUser}/$userId');
      sharedPreferences.setString('userData', response.data.toString());
      var data = Userinfo.fromMap(response.data);
      print('>>>>>>>>>>> Successfully: $data');
      return Right(data);
    } on DioException catch (error) {
      print(">>>>>>>>>>>>>>>>>>>>> Eror while getting user by Id: $error");
      return Left(error.toString());
    }
  }
}
