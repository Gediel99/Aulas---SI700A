import 'package:aula7/view/provider/counter_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    CounterProvider.helper.stream.listen((event) {
      if (event) {
        add(CounterEvent.increment);
      } else {
        add(CounterEvent.decrement);
      }
    });

    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          emit(state + 1);
          break;
        case CounterEvent.decrement:
          emit(state - 1);
          break;
      }
    });
  }
}

enum CounterEvent { increment, decrement }
