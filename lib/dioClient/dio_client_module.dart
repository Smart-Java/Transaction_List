import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:transactions_list/api/apiEndpoints/api_end_points.dart';
import 'package:transactions_list/di/injection.dart';
import 'package:transactions_list/dioClient/interceptors/network_interceptor.dart';

@module
abstract class DioClientModule {
  @lazySingleton
  Dio get dioClient => Dio(
        BaseOptions(
          baseUrl: APIEndPoints.baseURL,
        ),
      )..interceptors.addAll(
          [getIt<NetworkInterceptor>(),]);

  @injectable
  Connectivity get connectivity => Connectivity();
}
