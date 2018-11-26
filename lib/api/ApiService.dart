import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmd_app/api/api_const.dart';
import 'package:tmd_app/api/models/TrendingResponse.dart';

class ApiService {
  Future<TrendingResponse> getTrending() async {
    var url = _configureUrl("trending/movie/week");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return TrendingResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  String _configureUrl(String url) {
    return Uri.encodeFull(API_BASE_URL + url + "?api_key=$API_KEY");
  }
}
