class ProfileInfo {
  String _username;
  String _password;
  String _email;

  ProfileInfo() {
    _username = "";
    _password = "";
    _email = "";
  }

  ProfileInfo.fromMap(map) {
    this._username = map["username"];
    this._password = map["password"];
    this._email = map["email"];
  }

  String get username => _username;
  String get password => _password;
  String get email => _email;

  set username(String newUsername) {
    if (newUsername.length > 0 && newUsername.length <= 50) {
      this._username = newUsername;
    }
  }

  set password(String newPassword) {
    if (newPassword.length >= 10 && newPassword.length <= 30) {
      this._password = newPassword;
    }
  }

  set email(String newEmail) {
    if (newEmail.length > 0) {
      this._email = newEmail;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    map["email"] = _email;
    return map;
  }
}
