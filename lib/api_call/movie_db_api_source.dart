import 'package:netfolks/api_call/base_network.dart';

class MovieDataSource {
  static MovieDataSource instance = MovieDataSource();

  Future<Map<String, dynamic>> nowPlaying() {
    return BaseNetwork.get("now_playing");
  }
}

//
// import 'package:netfolks/api_call/base_network.dart';
//
// class CovidDataSource {
// static CovidDataSource instance = CovidDataSource();
// Future<Map<String, dynamic>> loadCountries() {
//     return BaseNetwork.get("countries");
//   }
// }