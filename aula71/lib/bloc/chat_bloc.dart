import 'package:aula71/provider/chat_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    ChatProvider.helper.stream.listen((resposta) {
      add(ServerEvent(resposta));
    });

    on<ChatEvent>((event, emit) {
      const String lChat = '';

      if (event is ServerEvent) {
        emit(ChatState(
          chatValue: "$lChat\n <h3 align = right>${event.message}</h3>",
        ));
      } else if (event is UserEvent) {
        emit(ChatState(
          chatValue: "lChat\n <h3 align = left>${event.message}</h3>",
        ));
      }
    });
  }
}

abstract class ChatEvent {
  final String message;
  ChatEvent(this.message);
}

class UserEvent extends ChatEvent {
  UserEvent(super.message);
}

class ServerEvent extends ChatEvent {
  ServerEvent(super.message);
}

class ChatState {
  final String chatValue;
  ChatState({this.chatValue = ""});
}
