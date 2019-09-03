import 'package:schat_server/schat_server.dart';
// ignore: implementation_imports
import 'package:aqueduct/src/utilities/token_generator.dart';
class BbAuthServer extends AuthServer {
  BbAuthServer(AuthServerDelegate delegate) : super(delegate);

  Future<AuthToken> bbAuthenticate(String openID, int clientID,
      {Duration expiration = const Duration(hours: 24),
        List<AuthScope> requestedScopes}) async {
    final token = _generateToken(openID, clientID, expiration.inSeconds);
    await delegate.addToken(this, token);

    return token;
  }
  AuthToken _generateToken(String openID, int clientID, int expirationInSeconds,
      {bool allowRefresh = true, List<AuthScope> scopes}) {
    final now = DateTime.now().toUtc();
    final token = AuthToken()
      ..accessToken = randomStringOfLength(32)
      ..issueDate = now
      ..expirationDate = now.add(Duration(seconds: expirationInSeconds))
      ..type = AuthServer.tokenTypeBearer
      ..resourceOwnerIdentifier = clientID
      ..scopes = scopes
      ..clientID = 'com.yqige.schat';

    if (allowRefresh) {
      token.refreshToken = randomStringOfLength(32);
    }

    return token;
  }

}
