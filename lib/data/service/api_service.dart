import 'package:dio/dio.dart';
import 'package:valorent_app/constants/app_constants.dart';

class ApiService {
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get() async {
    var respose = await dio.get(AppConstants.apiUrl);

    return respose.data;
  }
}
