import '../dio_client.dart';
import '../../../contants/api.dart';

class FoodRepository {
  var _httpClient;

  FoodRepository() {
    _httpClient = new DioClient();
  }
//Recebe da api
  Future<List<dynamic>> getFoods(String tokenCompany,
      {List<String> filterCategories}) async {
    final response =
        await _httpClient.get("$API_VERSION/products", queryParameters: {
      'token_company': tokenCompany,
      'categories': (filterCategories != null && filterCategories.length > 0
          ? filterCategories
          : [])
    });

    return (response.data['data'] as List).toList();

    // const API_URL = 'http://10.0.0.2/api/v1/products&token_company=fdsfs6d5f465';
  }
  //
  //
}
