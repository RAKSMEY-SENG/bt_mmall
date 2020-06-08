part of 'api_service.dart';

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://markarianmall.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UserModel> putUser(String username, String password) async {
    FormData formData = FormData.fromMap({
      "username": username,
      "pwd": password
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final Response _result = await _dio.post('web-service/ws-login.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            contentType: 'application/json;charset=UTF-8',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: formData);
    var object = jsonDecode(_result.data);
    UserModel  data = UserModel.fromJson(object);
    print(data);
    return Future.value(data);
  }

  @override
  Future<List<ProductModel>> getProduct() async {
    List<ProductModel> value = [];
    FormData formData = FormData.fromMap({
      "action": "get_all_product",
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final Response _result = await _dio.request('web-service/function.php',
      queryParameters: queryParameters,
      options: RequestOptions(
          method: 'POST',
          contentType: 'application/json;charset=UTF-8',
          headers: <String, dynamic>{},
          extra: _extra,
          baseUrl: baseUrl),
      data: formData,);
      var object = jsonDecode(_result.data);
       for(var i=0; i<10;i++){
         ProductModel  data = ProductModel.fromJson(object[i.toString()]);
         value.add(data);
       }
    return Future.value(value);
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    FormData formData = FormData.fromMap({
      "action": "category_term_image",
    });
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final Response _result = await _dio.request('web-service/function.php',
      queryParameters: queryParameters,
      options: RequestOptions(
          method: 'POST',
          headers: <String, dynamic>{},
          extra: _extra,
          baseUrl: baseUrl),
      data: formData,);
    List object = jsonDecode(_result.data);
    print(object);
    var value = object
        .map((dynamic i) => CategoryModel.fromJson(i as Map<String, dynamic>))
        .toList();
    print(value);
    return Future.value(value);
  }
}
