import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: _buildTabContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Current',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Hourly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '7-Day',
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_currentIndex) {
      case 0:
        return CurrentWeatherTab();
      case 1:
        return HourlyForecastTab();
      case 2:
        return SevenDayForecastTab();
      default:
        return Container();
    }
  }
}

class CurrentWeatherTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your current weather UI
    return Center(
      child: Text('Current Weather'),
    );
  }
}

class HourlyForecastTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your hourly forecast UI
    return Center(
      child: Text('Hourly Forecast'),
    );
  }
}

class SevenDayForecastTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your 7-day forecast UI
    return Center(
      child: Text('7-Day Forecast'),
    );
  }
}
