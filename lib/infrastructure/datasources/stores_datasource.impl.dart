

import 'package:dio/dio.dart';
import 'package:smart_games/config/constants/environment.dart';
import 'package:smart_games/domain/datasources/stores_datasource.dart';
import 'package:smart_games/domain/entities/store.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/models/stores_response.dart';

class StoresDatasourceImpl extends StoresDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl
  ));

  @override
  Future<List<Store>> getStores() async {
    try {
      final response = await dio.get('/stores',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final storesResponse = StoresResponse.fromJson(response.data);
        final List<Store> stores = storesResponse.results;
        return stores;
      }

      return [];

      // throw Exception();

    } on DioException catch(e) {
      // print(e.response?.statusCode);
      // print(e.response?.data['message']);

      if(e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(errorMessage: 'Connection Timeout');
      }

      if(e.response?.statusCode == 302) {
        throw CustomError(errorMessage: 'Unprocessable Content');
      }

      throw Exception();
    } catch(e) {
      print(e.toString());
      throw Exception();
    } 
  }

  
  @override
  Future<Store> getStore(String storeId) async {
    try {
      // final token = await keyValueSrorageService.getValue<String>('token');
      final response = await dio.get('/stores/$storeId',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          // "Authorization":
          //     "Bearer $token",
        }));

      if(response.statusCode == 200) {
        
        final Store store = Store.fromJson(response.data);
        return store;
      }

      throw Exception();

    } on DioException catch(e) {
      // print(e.toString());
      // print(e.response?.statusCode);
      // print(e.response?.data['message']);
      if(e.response?.statusCode == 403) {
        throw CustomError(errorMessage:  e.response?.data['message'] ?? 'Credenciales inválidas');
      }

      if(e.type == DioExceptionType.connectionTimeout) {
        throw CustomError(errorMessage: 'Connection Timeout');
      }

      if(e.response?.statusCode == 302) {
        throw CustomError(errorMessage: 'Unprocessable Content');
      }

      throw Exception();
    } catch(e) {
      //print(e.toString());
      throw Exception();
    } 
  }

}