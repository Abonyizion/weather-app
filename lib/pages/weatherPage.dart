
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/services/weather_service.dart';


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  
  //api key
  final _weatherService = WeatherService('ADD YOUR API KEY HERE');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get current city
    String cityName = await _weatherService.getCurrentCity();

    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }
  //date and time
  String formattedDate = DateFormat('EEEE d, MMMM yyyy').format(
      DateTime.now());
  String formattedTime = DateFormat('hh:mm a').format(
      DateTime.now());
  
  //weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/sunny.json';
    }
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/clouds.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunderstorm.json';
      case 'snow':
        return 'assets/winter.json';
      case 'clear':
        return 'assets/sunny.json';
        default:
          return 'assets/sunny.json';
        
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Weather Today"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              ),
          ),
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_weather?.cityName ?? "Loading city...", style: const TextStyle(
                    fontSize: 30, color: Colors.white
                  //  fontWeight: FontWeight.bold
                ),
                ),
                Text('${_weather?.temperature.toStringAsFixed(0) ?? ""}°C' ,
                  style: const TextStyle(fontSize: 70, color: Colors.white),
                ),
                Text(_weather?.mainCondition ?? "", style: const TextStyle(
                    fontSize: 30, color: Colors.white
                  //  fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(formattedDate, style: const TextStyle(
                    fontSize: 15, color: Colors.white
                 ),
                ),
                Text(formattedTime, style: const TextStyle(
                    fontSize: 15, color: Colors.white
                 ),
                ),
               const SizedBox(
                 height: 5,
               ),
                Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blue[500],
                    elevation: 2,
                    child: Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[500],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 children: [
                                   const Text('FeelsLike:', style: TextStyle(
                                        fontSize: 15, color: Colors.white
                                     ),
                                    ),
                                   Text('${_weather?.feelsLike.toStringAsFixed(0) ?? ""}°C', style: const TextStyle(
                                       fontSize: 22, color: Colors.white
                                   ),
                                   ),
                                 ],
                               ),
                               Column(
                                 children: [
                                   const Text('Min Temp:', style: TextStyle(
                                       fontSize: 15, color: Colors.white
                                   ),
                                   ),
                                   Text('${_weather?.minTemperature ?? ""}°C', style: const TextStyle(
                                       fontSize: 22, color: Colors.white
                                   ),
                                   ),
                                 ],
                               ),
                               Column(
                                 children: [
                                   const Text('Max Temp:', style: TextStyle(
                                       fontSize: 15, color: Colors.white
                                   ),
                                   ),
                                   Text('${_weather?.maxTemperature ?? ""}°C', style: const TextStyle(
                                       fontSize: 22, color: Colors.white
                                   ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(' windSpeed:', style: TextStyle(
                                      fontSize: 15, color: Colors.white
                                  ),
                                  ),
                                  Text('${_weather?.windSpeed ?? ""}m/s', style: const TextStyle(
                                      fontSize: 22, color: Colors.white
                                  ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(' Humidity:', style: TextStyle(
                                      fontSize: 15, color: Colors.white
                                  ),
                                  ),
                                  Text(' ${_weather?.humidity ?? ""}%', style: const TextStyle(
                                      fontSize: 22, color: Colors.white
                                  ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text('Pressure:', style: TextStyle(
                                      fontSize: 15, color: Colors.white
                                  ),
                                  ),
                                  Text(' ${_weather?.pressure ?? ""}mb', style: const TextStyle(
                                      fontSize: 22, color: Colors.white
                                  ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
