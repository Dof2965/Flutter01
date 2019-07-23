import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../model/results.dart';

class CompassClient {
  void _debugConsole(String str) {
    // debugPrint(utf8.encode(str).toString());
    debugPrint(str);
  }

  Future<Results> get(String query) async {
    var url = 'https://connpass.com/api/v1/event/';
    var httpClient = new HttpClient();

    try {
      debugPrint("Get URL: " + url + query);
      var request = await httpClient.getUrl(Uri.parse(url + query));
      var response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        debugPrint("Failed request status: " + response.statusCode.toString());
        return null;
      }

      // TODO: Logic refactoring may be...
      var jsonString = await response.transform(utf8.decoder).join();
      _debugConsole("Response Json: " + jsonString);
      var jsonResponse = json.decode(jsonString);
      return Results.fromJson(jsonResponse);
    } catch (exception) {
      debugPrint("Exception: " + exception.toString());
      return null;
    }
  }
}
