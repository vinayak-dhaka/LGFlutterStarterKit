import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/lg/lg_connection_service.dart';
import '../../services/lg/lg_command_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final LGConnectionService lg = LGConnectionService();

  final ipController = TextEditingController();
  final userController = TextEditingController(text: "lg");
  final passController = TextEditingController();

  String status = "Not connected";

  @override
  void initState() {
    super.initState();
    loadConfig();
  }

  Future<void> loadConfig() async {
    final prefs = await SharedPreferences.getInstance();

    ipController.text = prefs.getString("lg_ip") ?? "";
    userController.text = prefs.getString("lg_user") ?? "lg";
    passController.text = prefs.getString("lg_pass") ?? "";
  }

  Future<void> saveConfig() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("lg_ip", ipController.text);
    await prefs.setString("lg_user", userController.text);
    await prefs.setString("lg_pass", passController.text);
  }
Future<void> connect() async {

  setState(() => status = "Connecting...");

  final success = await lg.connect(
    host: ipController.text.trim(),
    username: userController.text.trim(),
    password: passController.text.trim(),
  );

  if (success) {
    await saveConfig();
  }

  // 🔥 FORCE UI UPDATE
  setState(() {
    status = success ? "Connected ✅" : "Failed ❌";
  });
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("LG Flutter Starter Kit")),

      body: Padding(
        padding: const EdgeInsets.all(20),

       child: Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [

    TextField(
      controller: ipController,
      decoration: const InputDecoration(
        labelText: "LG Master IP",
        hintText: "Run 'hostname -I' on LG master",
      ),
    ),

    TextField(
      controller: userController,
      decoration: const InputDecoration(
        labelText: "Username",
      ),
    ),

    TextField(
      controller: passController,
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      obscureText: true,
    ),

    const SizedBox(height: 20),

    /// 🔥 CONNECT BUTTON (THIS WAS MISSING)
    ElevatedButton(
      onPressed: connect,
      child: const Text("Connect"),
    ),

    const SizedBox(height: 15),

    Text(status, textAlign: TextAlign.center),

    const SizedBox(height: 30),

    /// TEST CONNECTION
    ElevatedButton(
      onPressed: status.contains("Connected")
          ? () async {
              final cmd = LGCommandService(lg, ipController.text.trim());
              await cmd.testConnection();
            }
          : null,
      child: const Text("Send Test Command"),
    ),

    /// FLY TO DELHI
    ElevatedButton(
      onPressed: status.contains("Connected")
          ? () async {
              final cmd = LGCommandService(lg, ipController.text.trim());
              await cmd.flyToDelhi();
            }
          : null,
      child: const Text("Fly to Delhi"),
    ),

    /// CLEAR VIEW
    ElevatedButton(
      onPressed: status.contains("Connected")
          ? () async {
              final cmd = LGCommandService(lg, ipController.text.trim());
              await cmd.clearView();
            }
          : null,
      child: const Text("Clear View"),
    ),

    /// SHOW DEMO KML
    ElevatedButton(
      onPressed: status.contains("Connected")
          ? () async {

              final cmd = LGCommandService(
                lg,
                ipController.text.trim(),
              );

              final kml = await rootBundle.loadString(
                'assets/kml/demo.kml',
              );

              await cmd.uploadDemoKML(kml);
            }
          : null,
      child: const Text("Show Demo KML"),
    ),

  ],
),

      ),
    );
  }
}
