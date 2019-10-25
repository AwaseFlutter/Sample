import 'package:meta/meta.dart';

@immutable
class User {
  final String id;
  final String name;
  final String photoUrl;
  final String createAt;
  final String updateAt;

  User(
      {@required this.id,
      @required this.name,
      @required this.photoUrl,
      @required this.createAt,
      @required this.updateAt})
      : assert(id != null),
        assert(name != null);
}
