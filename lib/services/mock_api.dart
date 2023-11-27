import 'package:dio/dio.dart';

class MockAPI {
  final baseURL = "https://655e6c86879575426b438237.mockapi.io/mini_projeto";
  final dio = Dio();

  Future<Map<String, dynamic>> getUser(String id) async {
    Response response;
    response = await dio.get(
      "$baseURL/users",
      queryParameters: {"id": id},
      options: Options(
        headers: {"content-type": 'application/json'},
      ),
    );
    if (response.statusCode != 200) {
      return {"error": "Algo deu errado"};
    }
    return response.data[0];
  }

  Future<Map<String, dynamic>> getLastPayslips(String id) async {
    Response response;
    response = await dio.get(
      "$baseURL/users/$id/contraCheque",
      options: Options(
        headers: {"content-type": 'application/json'},
      ),
    );
    if (response.statusCode != 200) {
      return {"error": "Algo deu errado"};
    }
    return response.data[0];
  }
}
