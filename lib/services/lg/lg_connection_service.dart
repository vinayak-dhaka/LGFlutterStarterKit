import 'package:dartssh2/dartssh2.dart';
import 'dart:io';

class LGConnectionService {
  SSHClient? _client;

  bool get isConnected => _client != null;

  Future<bool> connect({
    required String host,
    required String username,
    required String password,
  }) async {
    try {
      final socket = await SSHSocket.connect(host, 22);

      _client = SSHClient(
        socket,
        username: username,
        onPasswordRequest: () => password,
      );

      return true;
    } catch (e) {
      _client = null;
      return false;
    }
  }

  Future<String> execute(String command) async {
    if (_client == null) {
      throw Exception("Not connected to LG");
    }

    final session = await _client!.execute(command);

    final output = await stdout.addStream(session.stdout);
    final error = await stderr.addStream(session.stderr);

    await session.done;

    return ""; // We don’t need output for now
  }

  Future<void> disconnect() async {
    _client?.close();
    _client = null;
  }
  Future<String> runCommand(String command) async {
  return execute(command);
}

}
