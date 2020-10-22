

class TokenProvider {
  // 私有构造函数
  TokenProvider._() {
    // 具体初始化代码
  }

  // 静态私有成员，没有初始化
  static TokenProvider _instance;

  // 静态、同步、私有访问点
  static TokenProvider _sharedInstance() {
    if (_instance == null) {
      _instance = TokenProvider._();
    }
    return _instance;
  }

  // 单例公开访问点
  static TokenProvider get getInstance => _sharedInstance();

  static const tableName = "TokenInfo";
  static const id = "id";
  static const accessToken = "access_token";
  static const expiresIn = "expires_in";
  static const refreshToken = "refresh_token";
  static const tokenType = "token_type";


  String createTokenInfoSql = "CREATE TABLE $tableName ("
      "$id INTEGER PRIMARY KEY,"
      "$accessToken text,"
      "$expiresIn INTEGER,"
      "$refreshToken text,"
      "$tokenType text"
      ")";

//   Future<bool> insertTokenInfo(TokenModel tokenModel) async{
//    final db = await   DBProvider.db.database;
//    int res = await db.insert(tableName, tokenModel.toJson());
//    LogUtil.v("$tableName----insert token res:$res");
//    return res == 1;
//  }
//
//  Future<TokenModel> getTokenInfo() async {
//    final db = await   DBProvider.db.database;
//    var res = await db.query("$tableName");
//    List<TokenModel> list =
//    res.isNotEmpty ? res.map((c) => TokenModel.fromJson(c)).toList() : [];
//    LogUtil.v("$tableName----get token res:$res");
//    return list.first;
//  }




}
