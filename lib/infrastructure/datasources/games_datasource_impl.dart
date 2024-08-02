import 'package:dio/dio.dart';
import 'package:smart_games/config/constants/environment.dart';
import 'package:smart_games/domain/datasources/games_datasource.dart';
import 'package:smart_games/domain/entities/achievement.dart';
import 'package:smart_games/domain/entities/game.dart';
import 'package:smart_games/domain/entities/screenshot.dart';
import 'package:smart_games/infrastructure/errors/custom_error.dart';
import 'package:smart_games/infrastructure/models/achievements_response.dart';
import 'package:smart_games/infrastructure/models/games_response.dart';
import 'package:smart_games/infrastructure/models/screenshots_response.dart';

class GamesDatasourceImpl extends GamesDatasource  {

  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseUrl
  ));

  @override
  Future<Game> getGame(String gameId) async {
    try {
      // final token = await keyValueSrorageService.getValue<String>('token');
      final response = await dio.get('/games/$gameId',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          // "Authorization":
          //     "Bearer $token",
        }));

      if(response.statusCode == 200) {
        final Game game = Game.fromJson(response.data);
        return game;
      }

      throw Exception();

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
      //print(e.toString());
      throw Exception();
    } 
  }

  @override
  Future<List<Game>> getGames() async {
    try {
      final response = await dio.get('/games',  
        queryParameters: {
          "key": Environment.apiKey,
          // "dates": "2019-09-01,2019-09-30",
          // "platforms": "18,1,7"
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final gamesResponse = GamesResponse.fromJson(response.data);
        final List<Game> games = gamesResponse.results;
        return games;
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
      print(e.toString());
      throw Exception();
    } 
  }
  
  @override
  Future<List<Game>> getLatestGames() async{
    try {
      final response = await dio.get('/games',  
        queryParameters: {
          "key": Environment.apiKey,
          "dates": "2024-01-01,2024-07-01",
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final gamesResponse = GamesResponse.fromJson(response.data);
        final List<Game> games = gamesResponse.results;
        return games;
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
  
  @override
  Future<List<Game>> getMostPopularGames() async {
    try {
      final response = await dio.get('/games',  
        queryParameters: {
          "key": Environment.apiKey,
          "dates": "2023-01-01,2023-07-01",
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final gamesResponse = GamesResponse.fromJson(response.data);
        final List<Game> games = gamesResponse.results;
        return games;
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

  @override
  Future<List<Screenshot>> getScreenshots(String gameId) async {
    try {
      final response = await dio.get('/games/$gameId/screenshots',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final screenshotsResponse = ScreenshotsResponse.fromJson(response.data);
        final List<Screenshot> screenshots = screenshotsResponse.results;
        return screenshots;
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

  @override
  Future<List<Achievement>> getAchievements(String gameId) async {
    try {
      final response = await dio.get('/games/$gameId/achievements',  
        queryParameters: {
          "key": Environment.apiKey,
        },
        options: Options(headers: {
            "Content-Type": "application/json",
            // "Authorization": "Bearer $token",
        })
      );

      if(response.statusCode == 200) {
        final achievementsResponse = AchievementsResponse.fromJson(response.data);
        final List<Achievement> achievements = achievementsResponse.results;
        return achievements;
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

