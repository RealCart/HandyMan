import 'package:dartz/dartz.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/service_locator.dart';

abstract class BookingContraintsApiService {
  Future<Either> getBookingContraints();
}

class BookingContraintsApiServiceImpl extends BookingContraintsApiService {
  @override
  getBookingContraints() async {
    try {
      var response = await sl<DioClient>().get(ApiUrls.GetBookingConstraints);
      print(">>>>>>>>>>>>>>>> Successfuly: $response");
      return Right(response.data);
    } catch (error) {
      print(
          ">>>>>>>>>>>>>>>>>>>>>> Error while getching booking contraints: $error");
      return Left(error);
    }
  }
}
