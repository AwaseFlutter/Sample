import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sample_app/models/event.dart';

@immutable
abstract class EventListState extends Equatable {
  EventListState([List props = const []]) : super(props);
}

class EventListEmpty extends EventListState {
  @override
  String toString() => 'EventListEmpty';
}

class EventListInProgress extends EventListState {
  @override
  String toString() => 'EventListInProgress';
}

class EventListSuccess extends EventListState {
  final Stream<List<Event>> eventList;

  EventListSuccess({@required this.eventList})
      : assert(eventList != null),
        super([eventList]);

  @override
  String toString() => 'EventListSuccess';
}

class EventListFailure extends EventListState {
  final Error error;

  EventListFailure({@required this.error})
      : assert(error != null),
        super([error]);

  @override
  String toString() => 'EventListFailure';
}
