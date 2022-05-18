import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:Muvi/shared/constants/commons.dart';
import 'package:muvi_api/datasource/remote/data_muvi_api.dart';
import 'package:muvi_api/network/dio_client.dart';
import 'package:muvi_api/network/interceptors/logger_interceptor.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    final _dioAPI =
        await DioClient.setUpClient(baseUrl: CommonConstants.baseUrl);
    _dioAPI.interceptors.add(LoggerInterceptor());
    getIt.registerSingleton<Dio>(_dioAPI);
    final muviAPI = DataMuviAPI(getIt.get());
    getIt.registerSingleton<DataMuviAPI>(muviAPI, instanceName: 'api');
  }
}
