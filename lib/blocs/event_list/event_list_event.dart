import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EventListEvent extends Equatable {
  EventListEvent([List props = const []]) : super(props);
}

class EventListLoad extends EventListEvent {
  @override
  String toString() => 'EventListLoad';
}
