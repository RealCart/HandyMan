import 'package:dartz/dartz.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/data/models/service_category.dart';
import 'package:handy_man/service_locator.dart';

abstract class CategoriesApiService {
  Future<Either> getCategories();
}

class CategoriesApiServiceImpl extends CategoriesApiService {
  @override
  Future<Either> getCategories() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.serviceCategories);
      print("Successfully: $response");
      var data = ServiceCategory.fromMap(response.data);
      return Right(data.serviceCategoryList);
    } catch (error) {
      print("Error: $error");
      return Left(error);
    }
  }
}
