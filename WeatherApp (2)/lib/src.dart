import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Events
abstract class WeatherEvent {}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather(this.city);
}

// States
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Map<String, dynamic> weatherData;

  WeatherLoaded(this.weatherData);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}

// BLoC
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        var uri = Uri.https(
            'https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=${event.city}');
        final response = await http.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> data = json.decode(response.body);
          yield WeatherLoaded(data);
        } else {
          yield WeatherError('Failed to fetch weather data');
        }
      } catch (e) {
        yield WeatherError('An error occurred: $e');
      }
    }
  }
}
