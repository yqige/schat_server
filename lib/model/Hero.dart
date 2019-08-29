import 'package:aqueduct/aqueduct.dart';
import 'package:schat_server/schat_server.dart';

class Hero extends ManagedObject<_Hero> implements _Hero {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Hero {
  @primaryKey
  int id;
  @Column(unique: true)
  String name;
}
