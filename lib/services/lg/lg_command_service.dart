import 'lg_connection_service.dart';

class LGCommandService {

  final LGConnectionService connection;
  final String host;

  LGCommandService(this.connection, this.host);

  Future<void> flyToDelhi() async {

    await connection.runCommand(
        'echo "flytoview=<LookAt><latitude>28.6139</latitude><longitude>77.2090</longitude><range>3000000</range><tilt>60</tilt><heading>0</heading></LookAt>" > /tmp/query.txt');
  }

  Future<void> clearView() async {

    await connection.runCommand(
        'echo "flytoview=<LookAt><latitude>0</latitude><longitude>0</longitude><range>20000000</range><tilt>0</tilt><heading>0</heading></LookAt>" > /tmp/query.txt');
  }

Future<void> uploadDemoKML(String content) async {

  await connection.runCommand("""
sudo mkdir -p /var/www/html/assets/demo
sudo bash -c 'cat > /var/www/html/assets/demo/demo.kml << "EOF"
$content
EOF'
""");

  await connection.runCommand(
      'echo "http://$host:81/assets/demo/demo.kml" | sudo tee /var/www/html/kmls.txt');

  await connection.runCommand(
      'echo "refresh" > /tmp/query.txt');
}


Future<void> testConnection() async {
  await connection.runCommand(
      'echo "LG Starter Kit Connected" > /tmp/query.txt');
}
Future<void> showDatasetKml(String kml) async {

  await connection.execute("""
sudo bash -c 'cat > /var/www/html/dataset.kml << "EOF"
$kml
EOF'
""");

  await connection.execute(
      'echo "http://127.0.0.1:81/dataset.kml" | sudo tee /var/www/html/kmls.txt');

  await connection.execute(
      'echo "refresh" > /tmp/query.txt');
}

Future<void> showPlacemark({
  required String name,
  required double lat,
  required double lon,
}) async {

  final kml = '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
<Placemark>
  <name>$name</name>
  <Point>
    <coordinates>$lon,$lat,0</coordinates>
  </Point>
</Placemark>
</Document>
</kml>
''';

  // 1️⃣ Upload file
  await connection.execute("""
sudo bash -c 'cat > /var/www/html/marker.kml << "EOF"
$kml
EOF'
""");

  // 2️⃣ Register KML
  await connection.execute(
      'echo "http://localhost:81/marker.kml" | sudo tee /var/www/html/kmls.txt');

  // 3️⃣ TRIGGER LG WITH CAMERA MOVE (CRITICAL)
  await connection.execute(
      'echo "flytoview=<LookAt><latitude>$lat</latitude><longitude>$lon</longitude><range>200000</range><tilt>45</tilt><heading>0</heading></LookAt>" > /tmp/query.txt');
}

Future<void> showDemoKml() async {

  // 1️⃣ ensure demo file exists (optional but safe)
  await connection.execute("""
sudo bash -c 'cat > /var/www/html/demo.kml << "EOF"
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
<Document>
<Placemark>
<name>Demo Marker</name>
<Point>
<coordinates>77.2090,28.6139,0</coordinates>
</Point>
</Placemark>
</Document>
</kml>
EOF'
""");

  // 2️⃣ load into LG
  await connection.execute(
      'echo "http://localhost:81/demo.kml" | sudo tee /var/www/html/kmls.txt');

  // 3️⃣ CRITICAL — trigger camera move (same as manual)
  await connection.execute(
      'echo "flytoview=<LookAt><latitude>28.6139</latitude><longitude>77.2090</longitude><range>200000</range><tilt>45</tilt><heading>0</heading></LookAt>" > /tmp/query.txt');
}

}
