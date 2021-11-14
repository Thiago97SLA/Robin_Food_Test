import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:preuba_hewlett_packard/src/provider/DataApp.Dart';
import 'package:preuba_hewlett_packard/src/widget/Loading.dart';

Future<dynamic> getBooks(context, word, autor) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).size.height / 2, 0, 0),
          child: loadinginfo(),
        );
      });
  final data = Provider.of<DataApp>(context, listen: false);
  Uri uri;
  if (autor == true) {
    String url = 'openlibrary.org';
    String path = '/search/authors.json';
    Map<String, String> queryParameters = {'q': word.toLowerCase()};
    uri = Uri.https(url, path, queryParameters);
  } else {
    // http://openlibrary.org/search.json?q=the+lord+of+the+rings
    String url = 'openlibrary.org';
    String path = '/search.json';
    Map<String, String> queryParameters = {'q': word.toLowerCase()};
    uri = Uri.https(url, path, queryParameters);
  }

  try {
    final response = await http.get(uri);
    dynamic decodedata = json.decode(response.body);
    if (autor = true) {
      if (decodedata['numFoundExact'] == true) {
        data.setdataApp = decodedata['docs'];
        data.setstatusload = true;
        Navigator.of(context).pop();
      } else {
        data.setstatusload = false;
        Navigator.of(context).pop();
      }
    } else {
      if (decodedata['numFoundExact'] == true) {
        data.setdataApp = decodedata['docs'];
        data.setstatusload = true;
        Navigator.of(context).pop();
      } else {
        data.setstatusload = false;
        Navigator.of(context).pop();
      }
    }
    return response.body;
  } catch (e) {
    print(e);
  }
}
