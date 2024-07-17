import 'package:dio/dio.dart';
import 'package:smart_games/config/constants/environment.dart';
import 'package:smart_games/domain/datasources/games_datasource.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/models/games_response.dart';

class GamesDatasourceImpl extends GamesDatasource  {

  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl
  ));

  @override
  Future<Game> getGame(String eventId) {
    // TODO: implement getEvent
    throw UnimplementedError();
  }

  @override
  Future<List<Game>> getGames() async {
    try {
      final response = await dio.get('/games?key=${Environment.apiKey}',  options: Options(headers: {
          "Content-Type": "application/json",
          // "Authorization":
          //     "Bearer $token",
        }));

      if(response.statusCode == 200) {
        print(response.data);
        final gamesResponse = GamesResponse.fromJson(response.data);
        // final List<Game> games = gamesResponse.results;
      
        // return games;
      }

      return [];

      // throw Exception();

    } on DioException catch(e) {
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
      throw Exception();
    } 
  }

  

}

