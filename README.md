# WeatherApp using Flutter

This is a personal project I created using Dart & Flutter which gets weather updates from the OpenWeatherMap API. It technically has only 2 screens.

The first is an intro page and the other one is the main screen which displays the weather and more information: 
the date, the time, the location, max and min temperatures and an icon representing the weather condition.
You can clone it if you want by getting your unique API key from the openweather website and use the longituse and latitude of the desired city in the API call.

## how to clone the App

1. Create an account at OpenWeatherMap.
2. Then get your API key from https://home.openweathermap.org/api_keys.
Sometimes after getting your OpenWeatherMap API key it won't work right away
To test if your API key is working or not copy and paste the following link to your browser
https://api.openweathermap.org/data/2.5/weather?lat=9.0563&lon=7.4985&units=metric&appid=YOUR_API_KEY
Then replace YOUR_API_KEY with your own API key from OpenWeatherMap.
NOTE: you can replace the longitude and latitude from the link above with your desired location coordinates.
3. Clone the repo
git clone https://github.com/Abonyizion/weather-app
4. Install all the packages by typing
flutter pub get
5. Navigate to lib/pages/weatherpage.dart and paste your API key to the apiKey variable
final _weatherService = WeatherService('YOUR API KEY HERE');
6.Run the App
