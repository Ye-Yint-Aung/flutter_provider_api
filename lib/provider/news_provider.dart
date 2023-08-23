import 'dart:convert';

import 'package:api_test/api_service/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class NewsProvider extends ChangeNotifier {
  List<Articles> _articlesList = [];
  List<Articles> get articlesList => _articlesList;

  Future<List<Articles>> fetchNewsData() async {
    final response = await http.get(Uri.parse(ApiServices().url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'ok') {
        final List<dynamic> articalData = data['articles'];
        _articlesList = articalData
            .map((articleData) => Articles.fromJson(articleData))
            .toList();

        notifyListeners();
        return _articlesList;
      } else {
        return [];
      }
    } else {
      throw Exception("Failed");
    }
  }
}
