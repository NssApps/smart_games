

import 'package:dio/dio.dart';
import 'package:smart_games/config/constants/environment.dart';
import 'package:smart_games/domain/datasources/creators_datasource.dart';
import 'package:smart_games/domain/entities/creator.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/models/creators_response.dart';

class CreatorsDatasourceImpl extends CreatorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl
  ));

  @override
  Future<List<Creator>> getCreators() async {
    try {
      final response = await dio.get('/creators',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final gamesResponse = CreatorResponse.fromJson(response.data);
        final List<Creator> creators = gamesResponse.results;
        return creators;
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
      // print(e.toString());
      throw Exception();
    } 
  }

  @override
  Future<List<Game>> getGamesByCreator(String creatorId) {
    // TODO: implement getGamesByCreator
    throw UnimplementedError();
  }
  
  @override
  Future<Creator> getCreator(String creatorId) async {
    try {
      // final token = await keyValueSrorageService.getValue<String>('token');
      final response = await dio.get('/creators/$creatorId',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          // "Authorization":
          //     "Bearer $token",
        }));

      if(response.statusCode == 200) {
        
        final Creator creator = Creator.fromJson(response.data);
        return creator;
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