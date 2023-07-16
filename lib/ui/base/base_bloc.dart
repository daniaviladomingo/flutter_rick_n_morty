import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/ui/base/base_bloc_state.dart';

abstract class BaseBloc<Event, State> extends Bloc<Event, BaseBlocState<State>>{
  BaseBloc(super.initialState);
}