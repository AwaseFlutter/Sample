import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_app/blocs/event_list/event_list_repository.dart';
import 'package:sample_app/models/event.dart';

class FirestoreEventListRepository extends EventListRepository {
  final Firestore _firestore;

  FirestoreEventListRepository({Firestore firestore})
      : _firestore = firestore ?? Firestore.instance;

  @override
  Stream<List<Event>> fetch() {
    return _firestore.collection("events").snapshots().map((snapshot) {
      return snapshot.documents.map((docs) {
        return Event(
          id: docs.documentID,
          title: docs.data["title"] ?? "",
          description: docs.data["description"] ?? "",
          date: docs.data["date"]?.toDate() ?? DateTime.utc(2019),
          imageUrl: docs.data["image_url"] ?? "",
        );
      }).toList();
    });
  }
}
