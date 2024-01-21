// ignore_for_file: unnecessary_this

class Token {
  String? accessToken;

  Token({this.accessToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = this.accessToken;
    return data;
  }
}
