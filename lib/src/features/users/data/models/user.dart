import 'package:pey/src/features/users/data/models/bio.dart';
import 'package:pey/src/features/users/data/models/token.dart';
import 'package:pey/src/features/wallet/data/models/transaction_data.dart';

class User {
  BioData? bioData;
  String? verificationToken;
  String? recoveryToken;
  String? userName;
  String? email;
  Token? token;
  String? status;
  String? badge;
  TransactionToken? transactionToken;
  String? id;

  User(
      {this.bioData,
      this.verificationToken,
      this.recoveryToken,
      this.userName,
      this.email,
      this.token,
      this.status,
      this.badge,
      this.transactionToken,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    bioData = json['bio_data'] != null
        ? new BioData.fromJson(json['bio_data'])
        : null;
    verificationToken = json['verification_token'];
    recoveryToken = json['recovery_token'];
    userName = json['user_name'];
    email = json['email'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    status = json['status'];
    badge = json['badge'];
    transactionToken = json['transaction_token'] != null
        ? new TransactionToken.fromJson(json['transaction_token'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bioData != null) {
      data['bio_data'] = this.bioData!.toJson();
    }
    data['verification_token'] = this.verificationToken;
    data['recovery_token'] = this.recoveryToken;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    data['status'] = this.status;
    data['badge'] = this.badge;
    if (this.transactionToken != null) {
      data['transaction_token'] = this.transactionToken!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}
