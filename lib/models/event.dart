import 'package:meta/meta.dart';

@immutable
class Event {
  final String id; // ID
  final String title; // タイトル
  final String description; // 紹介文
  final DateTime date; // 開催日
  final String imageUrl; // イベント画像(URL)

  Event({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.imageUrl,
  })  : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(date != null),
        assert(imageUrl != null);

  static Event fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}
