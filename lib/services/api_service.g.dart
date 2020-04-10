part of 'api_service.dart';

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://markarianmall.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  putUser(String username, String password) async{
    FormData formData = FormData.fromMap({
      "username": username,
      "pwd": password
    });
    try {
      const _extra = <String, dynamic>{};
      final queryParameters = <String, dynamic>{};
      final Response _result = await _dio.post('web-service/ws-login.php',
          queryParameters: queryParameters,
          options: RequestOptions(
              method: 'POST',
              contentType: 'application/json',
              headers: <String, dynamic>{},
              extra: _extra,
              baseUrl: baseUrl),
          data: formData);
      print("Response result :"+_result.toString());
    } catch (e) {
      print("Error : " + e.toString());
    }
  }

}
