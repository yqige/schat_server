class AccessToken {
  AccessToken(json){
    accessToken = json['access_token'] as String;
    scope = json['scope'] as String;
    openid = json['openid'] as String;
    refreshToken = json['refresh_token'] as String;
    unionId = json['unionid'] as String;
    expiresIn = json['expires_in'] as int;
    errCode = json['errcode'] as int;
  }
  String accessToken;
  String scope;
  String openid;
  String refreshToken;
  String unionId;
  int expiresIn;
  int errCode;
}
