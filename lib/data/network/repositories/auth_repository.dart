import 'package:dio/dio.dart';
import '../dio_client.dart';
import '../interceptors/dio_interceptor_auth.dart';

class AuthRepository {
  Dio _dio = dioInterceptorAuth();

  Future auth(String email, String password) async {
    try {
      final response = await _dio.post('auth/token', data: {
        'email': email,
        'password': password,
        'device_name': 'apenas teste'
      });
      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.toString());
      print(e.response);
      print(e.response.statusCode);
      print(e.response.data);
    }
  }

  Future register(String name, String email, String password) async {
    try {
      final response = await _dio.post('auth/register',
          data: {'name': name, 'email': email, 'password': password});

      print(response.data);

      return response;
    } on DioError catch (e) {
      print(e.toString());
      print(e.response);
      print(e.response.statusCode);
      print(e.response.data);
    }
  }

  Future getMe() async {
    final response = await DioClient().get('auth/me');
  }
}