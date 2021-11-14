import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> getDescription(context, id) async {
  String url = 'https://openlibrary.org$id.json';

  try {
    final response = await http.get(url);
    dynamic decodedata = json.decode(response.body);
    return decodedata.toString();
  } catch (e) {
    print(e);
  }
}
