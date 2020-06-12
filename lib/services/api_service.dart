import 'dart:convert';

import 'package:btmmall/models/category_model.dart';
import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://markarianmall.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  @POST("web-service/ws-login.php")
  Future<UserModel> putUser(@Part() String username, @Part() String password);

  @GET("web-service/function.php")
  Future<List<ProductModel>> getProduct();

  @GET("web-service/function.php")
  Future<List<CategoryModel>> getCategory();

  @POST("web-service/function.php")
  Future<UserModel> fb_Register(@Part() String fid, @Part() String email, @Path() String firstname, @Path() String lastname, @Path() String name);

  @POST("web-service/function.php")
  Future<UserModel> Register(@Part() String username, @Part() String password);

}