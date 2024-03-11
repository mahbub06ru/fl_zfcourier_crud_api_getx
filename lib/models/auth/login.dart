// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final User? user;
  final String? token;

  AuthModel({
    this.user,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  final bool? isSeller;
  final bool? active;
  final bool? needToRefreshToken;
  final int? balance;
  final List<dynamic>? fcmTokens;
  final int? riderCommissionPerParcel;
  final int? smsBalance;
  final String? id;
  final String? fullName;
  final String? password;
  final String? phone;
  final String? email;
  final Role? role;
  final String? sellerInfo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Address? address;
  final int? otpCode;
  final String? gender;
  final int? invoicePerPage;
  final String? parcelInvoiceSize;

  User({
    this.isSeller,
    this.active,
    this.needToRefreshToken,
    this.balance,
    this.fcmTokens,
    this.riderCommissionPerParcel,
    this.smsBalance,
    this.id,
    this.fullName,
    this.password,
    this.phone,
    this.email,
    this.role,
    this.sellerInfo,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.otpCode,
    this.gender,
    this.invoicePerPage,
    this.parcelInvoiceSize,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    isSeller: json["isSeller"],
    active: json["active"],
    needToRefreshToken: json["needToRefreshToken"],
    balance: json["balance"],
    fcmTokens: json["fcmTokens"] == null ? [] : List<dynamic>.from(json["fcmTokens"]!.map((x) => x)),
    riderCommissionPerParcel: json["riderCommissionPerParcel"],
    smsBalance: json["smsBalance"],
    id: json["_id"],
    fullName: json["fullName"],
    password: json["password"],
    phone: json["phone"],
    email: json["email"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    sellerInfo: json["sellerInfo"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    otpCode: json["OTPCode"],
    gender: json["gender"],
    invoicePerPage: json["invoicePerPage"],
    parcelInvoiceSize: json["parcelInvoiceSize"],
  );

  Map<String, dynamic> toJson() => {
    "isSeller": isSeller,
    "active": active,
    "needToRefreshToken": needToRefreshToken,
    "balance": balance,
    "fcmTokens": fcmTokens == null ? [] : List<dynamic>.from(fcmTokens!.map((x) => x)),
    "riderCommissionPerParcel": riderCommissionPerParcel,
    "smsBalance": smsBalance,
    "_id": id,
    "fullName": fullName,
    "password": password,
    "phone": phone,
    "email": email,
    "role": role?.toJson(),
    "sellerInfo": sellerInfo,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address?.toJson(),
    "OTPCode": otpCode,
    "gender": gender,
    "invoicePerPage": invoicePerPage,
    "parcelInvoiceSize": parcelInvoiceSize,
  };
}

class Address {
  final String? id;
  final String? streetAddress;

  Address({
    this.id,
    this.streetAddress,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["_id"],
    streetAddress: json["streetAddress"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "streetAddress": streetAddress,
  };
}

class Role {
  final String? id;
  final String? alias;
  final String? permissionString;

  Role({
    this.id,
    this.alias,
    this.permissionString,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["_id"],
    alias: json["alias"],
    permissionString: json["permissionString"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "alias": alias,
    "permissionString": permissionString,
  };
}
