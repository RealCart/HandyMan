import 'package:dartz/dartz.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/data/models/services.dart';
import 'package:handy_man/service_locator.dart';

abstract class ServiceApiService {
  Future<Either> getService();
}

class ServiceApiServiceImpl extends ServiceApiService {
  @override
  Future<Either> getService() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.service);
      print('Successfully: $response');
      var data = Services.fromMap(response.data);
      return Right(data.services);
    } catch (error) {
      print('Error: $error');
      return Left(error);
    }
  }
}
