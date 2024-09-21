import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:socket_io_client/socket_io_client.dart';

class ChatProvider {
  static ChatProvider helper = ChatProvider._createInstance();
  final StreamController<String> _controller = StreamController<String>();

  Random random = Random();

  Stream get stream => _controller.stream;

  ChatProvider._createInstance() {
    List<String> messages = [
      "Olá, como vai?",
      "Estou bem, obrigado. E você?",
      "Estou bem também, mas estaria melhor em minha casa, professor",
    ];
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _controller.sink.add(messages[random.nextInt(2)]);
    });

    Socket socket = io(
        "https://1ba9a98e-f785-4605-aa8b-39d46644fe96-00-2zj8tzqdbk2pg.picard.replit.dev",
        OptionBuilder().setTransports(['websocket']).build());
    socket.on('server_information', (data) {
      String formattedData = '';
      data.forEach((key, value) {
        formattedData += '$key:$value; ';
      });
      _controller.sink.add(formattedData);
    });
  }
}
