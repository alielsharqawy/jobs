class MaritalStatusModel {
  MaritalStatusResult? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  MaritalStatusModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory MaritalStatusModel.fromJson(Map<String, dynamic> json) {
    return MaritalStatusModel(
      result: json['result'] != null ? MaritalStatusResult.fromJson(json['result']) : null,
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

class MaritalStatusResult {
  int? total;
  List<MaritalStatusItem>? statuses;

  MaritalStatusResult({this.total, this.statuses});

  factory MaritalStatusResult.fromJson(Map<String, dynamic> json) {
    return MaritalStatusResult(
      total: json['total'],
      statuses: json['results'] != null
          ? List<MaritalStatusItem>.from(json['results'].map((x) => MaritalStatusItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': statuses?.map((x) => x.toJson()).toList(),
    };
  }
}

class MaritalStatusItem {
  int? id;
  String? name;
  String? altText;
  String? additional;
  String? encId;

  MaritalStatusItem({
    this.id,
    this.name,
    this.altText,
    this.additional,
    this.encId,
  });

  factory MaritalStatusItem.fromJson(Map<String, dynamic> json) {
    return MaritalStatusItem(
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
