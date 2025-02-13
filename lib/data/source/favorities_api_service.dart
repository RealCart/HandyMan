import 'package:dartz/dartz.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/data/models/favorites.dart';
import 'package:handy_man/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritiesApiService {
  Future<Either> getFavorities();
}

class FavoritiesApiServiceImpl extends FavoritiesApiService {
  @override
  Future<Either> getFavorities() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var userId = sharedPreferences.getString("userData");
      var response =
          await sl<DioClient>().get('${ApiUrls.getFavorities}/$userId');
      print(">>>>>>>>>>>>>>>>>> Successfuly: $response");
      var data = Favorites.fromMap(response.data);
      return Right(data);
    } catch (error) {
      print(">>>>>>>>>>>>>>>>>>>>> ERROR WHILE FETCHING DATA: $error");
      return Left(error);
    }
  }
}
