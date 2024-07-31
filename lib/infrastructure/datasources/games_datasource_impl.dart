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
    try {
      // final token = await keyValueSrorageService.getValue<String>('token');
      final response = await dio.get('/lookup.php?i=$drinkId',  options: Options(headers: {
          "Content-Type": "application/json",
          // "Authorization":
          //     "Bearer $token",
        }));

      if(response.statusCode == 200) {
        final Drink drink = DrinkMapper.drinkToEntity(response.data['drinks'][0]);
        List<Ingredient> ingredients = [];

        for (var i = 0; i < 15; i++) {
          if(response.data['drinks'][0]['strIngredient${i + 1}'] != null) {
            ingredients.add(
              Ingredient(
                idIngredient: '0', 
                strIngredient: response.data['drinks'][0]['strIngredient${i + 1}'],
                measure: response.data['drinks'][0]['strMeasure${i + 1}'],
                imageUrlSmall: 'https://www.thecocktaildb.com/images/ingredients/${response.data['drinks'][0]['strIngredient${i + 1}']}-Small.png'
              )
            );

          } else {
            break;
          } 
        }

        drink.ingredients = ingredients;

        return drink;
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

  

}

