import 'dart:convert';
import 'package:http/http.dart' as http;

class WikipediaService {

  Future<Map<String, dynamic>?> searchPlace(String place) async {

    final url =
        "https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=$place&format=json";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode != 200) return null;

    final data = jsonDecode(res.body);

    if (data["query"]["search"].isEmpty) return null;

    final title = data["query"]["search"][0]["title"];

    final geoUrl =
        "https://en.wikipedia.org/w/api.php?action=query&prop=coordinates&titles=$title&format=json";

    final geoRes = await http.get(Uri.parse(geoUrl));

    if (geoRes.statusCode != 200) return null;

    final geoData = jsonDecode(geoRes.body);

    final pages = geoData["query"]["pages"];
    final page = pages.values.first;

    if (page["coordinates"] == null) return null;

    final coord = page["coordinates"][0];

    return {
      "name": title,
      "lat": coord["lat"],
      "lon": coord["lon"],
    };
  }
}
