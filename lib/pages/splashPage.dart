import 'package:flutter/material.dart';
import 'package:weather/pages/weatherPage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const WeatherPage()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.grey
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: Column(
          children: [
            const Expanded(
                child: Center(
                  child: Text("WEATHER TODAY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        fontFamily: 'Inter',
                    color: Colors.white),
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WeatherPage()));
                  },
                  child: const Text('Start',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'Inter',
                        color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }
}
