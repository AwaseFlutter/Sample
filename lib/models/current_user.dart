import 'package:meta/meta.dart';

@immutable
class CurrentUser {
  final String id; // ID
  final String name; // タイトル
  final String photoUrl; // 紹介文
  final bool isAnonymous; // 匿名かどうか
  final DateTime createdAt;
  final DateTime updatedAt;

  CurrentUser(
      {@required this.id,
      @required this.name,
      @required this.photoUrl,
      @required this.isAnonymous,
      @required this.createdAt,
      @required this.updatedAt})
      : assert(id != null),
        assert(name != null),
        assert(photoUrl != null),
        assert(isAnonymous != null),
        assert(createdAt != null),
        assert(updatedAt != null);
}
