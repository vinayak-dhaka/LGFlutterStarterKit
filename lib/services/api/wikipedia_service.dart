import 'dart:convert';
import 'package:http/http.dart' as http;

class WikipediaService {

  Future<Map<String, dynamic>?> searchPlace(String query) async {

    final url = Uri.parse(
      'https://en.wikipedia.org/w/api.php?action=query&list=geosearch&gscoord=28.6139|77.2090&gsradius=10000&gslimit=10&format=json'
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['query']['geosearch'].isNotEmpty) {
        final place = data['query']['geosearch'][0];

        return {
          "name": place["title"],
          "lat": place["lat"],
          "lon": place["lon"],
        };
      }
    }

    return null;
  }
}
