class TransactionToken {
  String? pin;
  String? status;
  String? recoveryToken;

  TransactionToken({this.pin, this.status, this.recoveryToken});

  TransactionToken.fromJson(Map<String, dynamic> json) {
    pin = json['pin'];
    status = json['status'];
    recoveryToken = json['recovery_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pin'] = this.pin;
    data['status'] = this.status;
    data['recovery_token'] = this.recoveryToken;
    return data;
  }
}
