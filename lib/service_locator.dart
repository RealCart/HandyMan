import 'package:get_it/get_it.dart';
import 'package:handy_man/core/network/dio_client.dart';
import 'package:handy_man/data/source/auth_api_service.dart';
import 'package:handy_man/data/source/auth_local_service.dart';
import 'package:handy_man/data/source/booking_api_service.dart';
import 'package:handy_man/data/source/categories_api_service.dart';
import 'package:handy_man/data/source/service_api_service.dart';

final sl = GetIt.I;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<AuthApiService>(AuthApiServiceImp());

  sl.registerSingleton<CategoriesApiService>(CategoriesApiServiceImpl());

  sl.registerSingleton<ServiceApiService>(ServiceApiServiceImpl());

  sl.registerSingleton<BookingApiService>(BookingApiServiceImpl());

  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
}
