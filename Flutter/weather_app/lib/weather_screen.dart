import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/hourly_forcast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrects.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      String cityName = "Bangladesh,Sylhet";
      final res = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey",
        ),
      );

      final data = jsonDecode(res.body);
      if (data["cod"] != "200") throw "An unaccpected error occured.";

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          setState(() {});
        }, icon: Icon(Icons.refresh))],
      ),

      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;
          final currentWeatherData = data["list"][0];
          final currentTemp = currentWeatherData["main"]["temp"];
          final currentSky = currentWeatherData["weather"][0]["main"];
          final currentPressure = currentWeatherData["main"]["pressure"];
          final currentHumidity = currentWeatherData["main"]["humidity"];
          final currentWindSpeed = currentWeatherData["wind"]["speed"];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),

                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                        child: Padding(
                          padding: EdgeInsets.all(16.0),

                          child: Column(
                            children: [
                              Text(
                                "${(currentTemp-273.15).toStringAsFixed(2)} °C",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Icon(
                                currentSky == "Clouds" || currentSky == "Rain"
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 50,
                              ),
                              SizedBox(height: 20),
                              Text(currentSky, style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //weather forcast card
                const Text(
                  "Hourly Forecast",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final huorlyForecast = data["list"][index + 1];
                      final time = DateTime.parse(huorlyForecast["dt_txt"]);
                      return HourlyForcastItem(
                        time: DateFormat.j().format(time),
                        icon:
                            huorlyForecast["weather"][0]["main"] == "Clouds" ||
                                huorlyForecast["weather"][0]["main"] == "Rain"
                            ? Icons.cloud
                            : Icons.sunny,
                        temperature: "${(huorlyForecast["main"]["temp"]-273.15).toStringAsFixed(2)} °C",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                //aditional information
                const Text(
                  "Additional Information",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditinalInformation(
                      icon: Icons.water_drop,
                      lable: "Humidity",
                      value: currentHumidity.toString(),
                    ),
                    AdditinalInformation(
                      icon: Icons.air,
                      lable: "Wind Speed",
                      value: currentWindSpeed.toString(),
                    ),
                    AdditinalInformation(
                      icon: Icons.beach_access,
                      lable: "Pressure",
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}
