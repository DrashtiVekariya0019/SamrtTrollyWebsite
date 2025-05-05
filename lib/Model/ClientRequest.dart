class Clientrequest {
  Clientrequest({
    required this.success,
    required this.message,
    required this.status,
    required this.data,
    required this.error,
  });

  final bool? success;
  final String? message;
  final int? status;
  final Data? data;
  final dynamic error;

  factory Clientrequest.fromJson(Map<String, dynamic> json){
    return Clientrequest(
      success: json["success"],
      message: json["message"],
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      error: json["error"],
    );
  }

}

class Data {
  Data({
    required this.name,
    required this.email,
    required this.mobileNumber,
    required this.isRequestApproved,
    required this.deletedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.isActive,
    required this.isDeleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? name;
  final String? email;
  final int? mobileNumber;
  final bool? isRequestApproved;
  final dynamic deletedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedBy;
  final bool? isActive;
  final bool? isDeleted;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      name: json["name"],
      email: json["email"],
      mobileNumber: json["mobileNumber"],
      isRequestApproved: json["isRequestApproved"],
      deletedAt: json["deletedAt"],
      createdBy: json["createdBy"],
      updatedBy: json["updatedBy"],
      deletedBy: json["deletedBy"],
      isActive: json["isActive"],
      isDeleted: json["isDeleted"],
      id: json["_id"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}
