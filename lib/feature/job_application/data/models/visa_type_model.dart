class VisaTypeModel {
  VisaTypeResult? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  VisaTypeModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory VisaTypeModel.fromJson(Map<String, dynamic> json) {
    return VisaTypeModel(
      result: json['result'] != null ? VisaTypeResult.fromJson(json['result']) : null,
      targetUrl: json['targetUrl'],
      success: json['success'],
      error: json['error'],
      unAuthorizedRequest: json['unAuthorizedRequest'],
      abp: json['__abp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result?.toJson(),
      'targetUrl': targetUrl,
      'success': success,
      'error': error,
      'unAuthorizedRequest': unAuthorizedRequest,
      '__abp': abp,
    };
  }
}

class VisaTypeResult {
  int? total;
  List<VisaTypeItem>? visaTypes;

  VisaTypeResult({this.total, this.visaTypes});

  factory VisaTypeResult.fromJson(Map<String, dynamic> json) {
    return VisaTypeResult(
      total: json['total'],
      visaTypes: json['results'] != null
          ? List<VisaTypeItem>.from(json['results'].map((x) => VisaTypeItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': visaTypes?.map((x) => x.toJson()).toList(),
    };
  }
}

class VisaTypeItem {
  int? id;
  String? name;
  String? altText;
  String? additional;
  String? encId;

  VisaTypeItem({
    this.id,
    this.name,
    this.altText,
    this.additional,
    this.encId,
  });

  factory VisaTypeItem.fromJson(Map<String, dynamic> json) {
    return VisaTypeItem(
      id: json['id'],
      name: json['text'],
      altText: json['altText'],
      additional: json['additional'],
      encId: json['encId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': name,
      'altText': altText,
      'additional': additional,
      'encId': encId,
    };
  }
}
