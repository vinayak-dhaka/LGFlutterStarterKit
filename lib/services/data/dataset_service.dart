class DatasetService {

  /// Converts a list of dataset points to a KML string
  static String buildKmlFromPoints({
    required String documentName,
    required List<Map<String, dynamic>> points,
  }) {

    final placemarks = points.map((p) => """
    <Placemark>
      <name>${p["name"]}</name>
      <description>${p["description"] ?? ""}</description>
      <Point>
        <coordinates>${p["lon"]},${p["lat"]},0</coordinates>
      </Point>
    </Placemark>
    """).join();

    return """
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
<name>$documentName</name>
$placemarks
</Document>
</kml>
""";
  }
}
