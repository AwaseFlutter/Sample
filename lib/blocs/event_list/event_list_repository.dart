import 'package:sample_app/models/event.dart';

abstract class EventListRepository {
  Stream<List<Event>> fetch();
}
