import 'package:dartz/dartz.dart';
import 'package:handy_man/core/constants/api_urls.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/service_locator.dart';

abstract class BookingApiService {
  Future<Either> getBookings();
}

class BookingApiServiceImpl extends BookingApiService {
  @override
  Future<Either> getBookings() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrls.bookings,
      );
      print(">>>>>>>> Successfully: $response");
      return Right(response);
    } catch (error) {
      print(">>>>>>>>> Error catched while geting bookings: $error");
      return Left(error);
    }
  }
}
