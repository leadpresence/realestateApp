import 'dart:convert';

class ProperttiesResponse {
    final List<Datum>? data;
    final dynamic ex;
    final String? message;
    final bool? success;

    ProperttiesResponse({
        this.data,
        this.ex,
        this.message,
        this.success,
    });

    ProperttiesResponse copyWith({
        List<Datum>? data,
        dynamic ex,
        String? message,
        bool? success,
    }) => 
        ProperttiesResponse(
            data: data ?? this.data,
            ex: ex ?? this.ex,
            message: message ?? this.message,
            success: success ?? this.success,
        );

    factory ProperttiesResponse.fromRawJson(String str) => ProperttiesResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProperttiesResponse.fromJson(Map<String, dynamic> json) => ProperttiesResponse(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        ex: json["ex"],
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "ex": ex,
        "message": message,
        "success": success,
    };
}

class Datum {
    final int? id;
    final String? propertyType;
    final int? size;
    final int? price;
    final String? location;
    final String? description;
    final int? sellingPrice;
    final int? offeringPrice;
    final int? allowInstallments;

    Datum({
        this.id,
        this.propertyType,
        this.size,
        this.price,
        this.location,
        this.description,
        this.sellingPrice,
        this.offeringPrice,
        this.allowInstallments,
    });

    Datum copyWith({
        int? id,
        String? propertyType,
        int? size,
        int? price,
        String? location,
        String? description,
        int? sellingPrice,
        int? offeringPrice,
        int? allowInstallments,
    }) => 
        Datum(
            id: id ?? this.id,
            propertyType: propertyType ?? this.propertyType,
            size: size ?? this.size,
            price: price ?? this.price,
            location: location ?? this.location,
            description: description ?? this.description,
            sellingPrice: sellingPrice ?? this.sellingPrice,
            offeringPrice: offeringPrice ?? this.offeringPrice,
            allowInstallments: allowInstallments ?? this.allowInstallments,
        );

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        propertyType: json["propertyType"],
        size: json["size"],
        price: json["price"],
        location: json["location"],
        description: json["description"],
        sellingPrice: json["sellingPrice"],
        offeringPrice: json["offeringPrice"],
        allowInstallments: json["allowInstallments"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "propertyType": propertyType,
        "size": size,
        "price": price,
        "location": location,
        "description": description,
        "sellingPrice": sellingPrice,
        "offeringPrice": offeringPrice,
        "allowInstallments": allowInstallments,
    };
}
