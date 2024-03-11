// To parse this JSON data, do
//
//     final parcelUpdate = parcelUpdateFromJson(jsonString);

import 'dart:convert';

ParcelUpdate parcelUpdateFromJson(String str) => ParcelUpdate.fromJson(json.decode(str));

String parcelUpdateToJson(ParcelUpdate data) => json.encode(data.toJson());

class ParcelUpdate {
  final String? status;
  final List<dynamic>? parcelGroupRecords;
  final List<dynamic>? statusRecordList;
  final int? deliveryCharge;
  final int? returnCharge;
  final double? merchantAmount;
  final double? totalCharge;
  final double? codCharge;
  final int? collectedAmount;
  final int? fine;
  final bool? payable;
  final String? paymentStatus;
  final bool? editable;
  final int? stockPrice;
  final bool? partialDelivered;
  final int? previousPrice;
  final bool? receivedInHubManually;
  final bool? assignDeliverymanManually;
  final int? weightCharge;
  final String? id;
  final String? merchantOrderId;
  final String? recipientName;
  final String? recipientPhone;
  final String? recipientCity;
  final String? recipientArea;
  final String? recipientZone;
  final String? recipientAddress;
  final int? amountToCollect;
  final String? itemDescription;
  final int? itemQuantity;
  final int? itemWeight;
  final String? specialInstruction;
  final String? shopId;
  final Seller? seller;
  final String? cityType;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? invoice;
  final int? v;

  ParcelUpdate({
    this.status,
    this.parcelGroupRecords,
    this.statusRecordList,
    this.deliveryCharge,
    this.returnCharge,
    this.merchantAmount,
    this.totalCharge,
    this.codCharge,
    this.collectedAmount,
    this.fine,
    this.payable,
    this.paymentStatus,
    this.editable,
    this.stockPrice,
    this.partialDelivered,
    this.previousPrice,
    this.receivedInHubManually,
    this.assignDeliverymanManually,
    this.weightCharge,
    this.id,
    this.merchantOrderId,
    this.recipientName,
    this.recipientPhone,
    this.recipientCity,
    this.recipientArea,
    this.recipientZone,
    this.recipientAddress,
    this.amountToCollect,
    this.itemDescription,
    this.itemQuantity,
    this.itemWeight,
    this.specialInstruction,
    this.shopId,
    this.seller,
    this.cityType,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.invoice,
    this.v,
  });

  factory ParcelUpdate.fromJson(Map<String, dynamic> json) => ParcelUpdate(
    status: json["status"],
    parcelGroupRecords: json["parcelGroupRecords"] == null ? [] : List<dynamic>.from(json["parcelGroupRecords"]!.map((x) => x)),
    statusRecordList: json["statusRecordList"] == null ? [] : List<dynamic>.from(json["statusRecordList"]!.map((x) => x)),
    deliveryCharge: json["deliveryCharge"],
    returnCharge: json["returnCharge"],
    merchantAmount: json["merchantAmount"]?.toDouble(),
    totalCharge: json["totalCharge"]?.toDouble(),
    codCharge: json["CODCharge"]?.toDouble(),
    collectedAmount: json["collectedAmount"],
    fine: json["fine"],
    payable: json["payable"],
    paymentStatus: json["paymentStatus"],
    editable: json["editable"],
    stockPrice: json["stockPrice"],
    partialDelivered: json["partialDelivered"],
    previousPrice: json["previousPrice"],
    receivedInHubManually: json["receivedInHubManually"],
    assignDeliverymanManually: json["assignDeliverymanManually"],
    weightCharge: json["weightCharge"],
    id: json["_id"],
    merchantOrderId: json["merchantOrderId"],
    recipientName: json["recipientName"],
    recipientPhone: json["recipientPhone"],
    recipientCity: json["recipientCity"],
    recipientArea: json["recipientArea"],
    recipientZone: json["recipientZone"],
    recipientAddress: json["recipientAddress"],
    amountToCollect: json["amountToCollect"],
    itemDescription: json["itemDescription"],
    itemQuantity: json["itemQuantity"],
    itemWeight: json["itemWeight"],
    specialInstruction: json["specialInstruction"],
    shopId: json["shopId"],
    seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
    cityType: json["cityType"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    invoice: json["invoice"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "parcelGroupRecords": parcelGroupRecords == null ? [] : List<dynamic>.from(parcelGroupRecords!.map((x) => x)),
    "statusRecordList": statusRecordList == null ? [] : List<dynamic>.from(statusRecordList!.map((x) => x)),
    "deliveryCharge": deliveryCharge,
    "returnCharge": returnCharge,
    "merchantAmount": merchantAmount,
    "totalCharge": totalCharge,
    "CODCharge": codCharge,
    "collectedAmount": collectedAmount,
    "fine": fine,
    "payable": payable,
    "paymentStatus": paymentStatus,
    "editable": editable,
    "stockPrice": stockPrice,
    "partialDelivered": partialDelivered,
    "previousPrice": previousPrice,
    "receivedInHubManually": receivedInHubManually,
    "assignDeliverymanManually": assignDeliverymanManually,
    "weightCharge": weightCharge,
    "_id": id,
    "merchantOrderId": merchantOrderId,
    "recipientName": recipientName,
    "recipientPhone": recipientPhone,
    "recipientCity": recipientCity,
    "recipientArea": recipientArea,
    "recipientZone": recipientZone,
    "recipientAddress": recipientAddress,
    "amountToCollect": amountToCollect,
    "itemDescription": itemDescription,
    "itemQuantity": itemQuantity,
    "itemWeight": itemWeight,
    "specialInstruction": specialInstruction,
    "shopId": shopId,
    "seller": seller?.toJson(),
    "cityType": cityType,
    "createdBy": createdBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "invoice": invoice,
    "__v": v,
  };
}

class Seller {
  final List<dynamic>? productCategories;
  final bool? emailVerified;
  final bool? verified;
  final bool? requestForVerification;
  final bool? showShopInHomepage;
  final bool? active;
  final String? id;
  final String? companyName;
  final String? phoneNumber1;
  final String? ownerName;
  final String? email;
  final SubscriptionPlan? subscriptionPlan;
  final List<dynamic>? warehouseAddressList;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? bankAccountHolderName;
  final String? bankAccountNumber;
  final String? bankBranchName;
  final String? bankName;
  final String? bankRoutingNumber;
  final String? bkash;
  final String? nagad;
  final dynamic reasonOfRejection;
  final String? rocket;
  final String? streetAddress;

  Seller({
    this.productCategories,
    this.emailVerified,
    this.verified,
    this.requestForVerification,
    this.showShopInHomepage,
    this.active,
    this.id,
    this.companyName,
    this.phoneNumber1,
    this.ownerName,
    this.email,
    this.subscriptionPlan,
    this.warehouseAddressList,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.bankAccountHolderName,
    this.bankAccountNumber,
    this.bankBranchName,
    this.bankName,
    this.bankRoutingNumber,
    this.bkash,
    this.nagad,
    this.reasonOfRejection,
    this.rocket,
    this.streetAddress,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    productCategories: json["productCategories"] == null ? [] : List<dynamic>.from(json["productCategories"]!.map((x) => x)),
    emailVerified: json["emailVerified"],
    verified: json["verified"],
    requestForVerification: json["requestForVerification"],
    showShopInHomepage: json["showShopInHomepage"],
    active: json["active"],
    id: json["_id"],
    companyName: json["companyName"],
    phoneNumber1: json["phoneNumber1"],
    ownerName: json["ownerName"],
    email: json["email"],
    subscriptionPlan: json["subscriptionPlan"] == null ? null : SubscriptionPlan.fromJson(json["subscriptionPlan"]),
    warehouseAddressList: json["warehouseAddressList"] == null ? [] : List<dynamic>.from(json["warehouseAddressList"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    bankAccountHolderName: json["bankAccountHolderName"],
    bankAccountNumber: json["bankAccountNumber"],
    bankBranchName: json["bankBranchName"],
    bankName: json["bankName"],
    bankRoutingNumber: json["bankRoutingNumber"],
    bkash: json["bkash"],
    nagad: json["nagad"],
    reasonOfRejection: json["reasonOfRejection"],
    rocket: json["rocket"],
    streetAddress: json["streetAddress"],
  );

  Map<String, dynamic> toJson() => {
    "productCategories": productCategories == null ? [] : List<dynamic>.from(productCategories!.map((x) => x)),
    "emailVerified": emailVerified,
    "verified": verified,
    "requestForVerification": requestForVerification,
    "showShopInHomepage": showShopInHomepage,
    "active": active,
    "_id": id,
    "companyName": companyName,
    "phoneNumber1": phoneNumber1,
    "ownerName": ownerName,
    "email": email,
    "subscriptionPlan": subscriptionPlan?.toJson(),
    "warehouseAddressList": warehouseAddressList == null ? [] : List<dynamic>.from(warehouseAddressList!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "bankAccountHolderName": bankAccountHolderName,
    "bankAccountNumber": bankAccountNumber,
    "bankBranchName": bankBranchName,
    "bankName": bankName,
    "bankRoutingNumber": bankRoutingNumber,
    "bkash": bkash,
    "nagad": nagad,
    "reasonOfRejection": reasonOfRejection,
    "rocket": rocket,
    "streetAddress": streetAddress,
  };
}

class SubscriptionPlan {
  final bool? subscriptionPlanDefault;
  final String? id;
  final int? insideCityMinPrice;
  final int? subCityMinPrice;
  final int? outsideCityMinPrice;
  final int? minWeightThreshold;
  final int? minWeightThresholdInsideCity;
  final int? minWeightThresholdSubCity;
  final int? minWeightThresholdOutsideCity;
  final int? insideCityMaxPrice;
  final int? subCityMaxPrice;
  final int? outsideCityMaxPrice;
  final int? maxWeightThreshold;
  final int? maxWeightThresholdInsideCity;
  final int? maxWeightThresholdSubCity;
  final int? maxWeightThresholdOutsideCity;
  final int? extraWeightUnit;
  final int? extraWeightUnitInsideCity;
  final int? extraWeightUnitSubCity;
  final int? extraWeightUnitOutsideCity;
  final int? pricePerExtraWeightUnitInsideCity;
  final int? pricePerExtraWeightUnitSubCity;
  final int? pricePerExtraWeightUnitOutsideCity;
  final int? codChargePercentage;
  final int? codChargePercentageInsideCity;
  final int? codChargePercentageSubCity;
  final int? codChargePercentageOutsideCity;
  final int? minReturnChargeInsideCity;
  final int? minReturnChargeSubCity;
  final int? minReturnChargeOutsideCity;

  SubscriptionPlan({
    this.subscriptionPlanDefault,
    this.id,
    this.insideCityMinPrice,
    this.subCityMinPrice,
    this.outsideCityMinPrice,
    this.minWeightThreshold,
    this.minWeightThresholdInsideCity,
    this.minWeightThresholdSubCity,
    this.minWeightThresholdOutsideCity,
    this.insideCityMaxPrice,
    this.subCityMaxPrice,
    this.outsideCityMaxPrice,
    this.maxWeightThreshold,
    this.maxWeightThresholdInsideCity,
    this.maxWeightThresholdSubCity,
    this.maxWeightThresholdOutsideCity,
    this.extraWeightUnit,
    this.extraWeightUnitInsideCity,
    this.extraWeightUnitSubCity,
    this.extraWeightUnitOutsideCity,
    this.pricePerExtraWeightUnitInsideCity,
    this.pricePerExtraWeightUnitSubCity,
    this.pricePerExtraWeightUnitOutsideCity,
    this.codChargePercentage,
    this.codChargePercentageInsideCity,
    this.codChargePercentageSubCity,
    this.codChargePercentageOutsideCity,
    this.minReturnChargeInsideCity,
    this.minReturnChargeSubCity,
    this.minReturnChargeOutsideCity,
  });

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) => SubscriptionPlan(
    subscriptionPlanDefault: json["default"],
    id: json["_id"],
    insideCityMinPrice: json["insideCityMinPrice"],
    subCityMinPrice: json["subCityMinPrice"],
    outsideCityMinPrice: json["outsideCityMinPrice"],
    minWeightThreshold: json["minWeightThreshold"],
    minWeightThresholdInsideCity: json["minWeightThresholdInsideCity"],
    minWeightThresholdSubCity: json["minWeightThresholdSubCity"],
    minWeightThresholdOutsideCity: json["minWeightThresholdOutsideCity"],
    insideCityMaxPrice: json["insideCityMaxPrice"],
    subCityMaxPrice: json["subCityMaxPrice"],
    outsideCityMaxPrice: json["outsideCityMaxPrice"],
    maxWeightThreshold: json["maxWeightThreshold"],
    maxWeightThresholdInsideCity: json["maxWeightThresholdInsideCity"],
    maxWeightThresholdSubCity: json["maxWeightThresholdSubCity"],
    maxWeightThresholdOutsideCity: json["maxWeightThresholdOutsideCity"],
    extraWeightUnit: json["extraWeightUnit"],
    extraWeightUnitInsideCity: json["extraWeightUnitInsideCity"],
    extraWeightUnitSubCity: json["extraWeightUnitSubCity"],
    extraWeightUnitOutsideCity: json["extraWeightUnitOutsideCity"],
    pricePerExtraWeightUnitInsideCity: json["pricePerExtraWeightUnitInsideCity"],
    pricePerExtraWeightUnitSubCity: json["pricePerExtraWeightUnitSubCity"],
    pricePerExtraWeightUnitOutsideCity: json["pricePerExtraWeightUnitOutsideCity"],
    codChargePercentage: json["CODChargePercentage"],
    codChargePercentageInsideCity: json["CODChargePercentageInsideCity"],
    codChargePercentageSubCity: json["CODChargePercentageSubCity"],
    codChargePercentageOutsideCity: json["CODChargePercentageOutsideCity"],
    minReturnChargeInsideCity: json["minReturnChargeInsideCity"],
    minReturnChargeSubCity: json["minReturnChargeSubCity"],
    minReturnChargeOutsideCity: json["minReturnChargeOutsideCity"],
  );

  Map<String, dynamic> toJson() => {
    "default": subscriptionPlanDefault,
    "_id": id,
    "insideCityMinPrice": insideCityMinPrice,
    "subCityMinPrice": subCityMinPrice,
    "outsideCityMinPrice": outsideCityMinPrice,
    "minWeightThreshold": minWeightThreshold,
    "minWeightThresholdInsideCity": minWeightThresholdInsideCity,
    "minWeightThresholdSubCity": minWeightThresholdSubCity,
    "minWeightThresholdOutsideCity": minWeightThresholdOutsideCity,
    "insideCityMaxPrice": insideCityMaxPrice,
    "subCityMaxPrice": subCityMaxPrice,
    "outsideCityMaxPrice": outsideCityMaxPrice,
    "maxWeightThreshold": maxWeightThreshold,
    "maxWeightThresholdInsideCity": maxWeightThresholdInsideCity,
    "maxWeightThresholdSubCity": maxWeightThresholdSubCity,
    "maxWeightThresholdOutsideCity": maxWeightThresholdOutsideCity,
    "extraWeightUnit": extraWeightUnit,
    "extraWeightUnitInsideCity": extraWeightUnitInsideCity,
    "extraWeightUnitSubCity": extraWeightUnitSubCity,
    "extraWeightUnitOutsideCity": extraWeightUnitOutsideCity,
    "pricePerExtraWeightUnitInsideCity": pricePerExtraWeightUnitInsideCity,
    "pricePerExtraWeightUnitSubCity": pricePerExtraWeightUnitSubCity,
    "pricePerExtraWeightUnitOutsideCity": pricePerExtraWeightUnitOutsideCity,
    "CODChargePercentage": codChargePercentage,
    "CODChargePercentageInsideCity": codChargePercentageInsideCity,
    "CODChargePercentageSubCity": codChargePercentageSubCity,
    "CODChargePercentageOutsideCity": codChargePercentageOutsideCity,
    "minReturnChargeInsideCity": minReturnChargeInsideCity,
    "minReturnChargeSubCity": minReturnChargeSubCity,
    "minReturnChargeOutsideCity": minReturnChargeOutsideCity,
  };
}
