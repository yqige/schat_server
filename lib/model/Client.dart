import 'package:aqueduct/aqueduct.dart';
import 'package:schat_server/schat_server.dart';

class Client extends ManagedObject<_Client> implements _Client {
  @override
  void willUpdate() {
  }

  @override
  void willInsert() {
  }
}

class _Client {
  @primaryKey
  int id;
  @Column()
  String openId;
  @Column()
  String nickName;
  @Column()
  int userId;
}
