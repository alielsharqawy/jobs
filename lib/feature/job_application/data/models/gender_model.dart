class GenderModel {
  GenderResult? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  GenderModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) {
    return GenderModel(
      result: json['result'] != null ? GenderResult.fromJson(json['result']) : null,
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

class GenderResult {
  int? total;
  List<GenderItem>? genders;

  GenderResult({this.total, this.genders});

  factory GenderResult.fromJson(Map<String, dynamic> json) {
    return GenderResult(
      total: json['total'],
      genders: json['results'] != null
          ? List<GenderItem>.from(json['results'].map((x) => GenderItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': genders?.map((x) => x.toJson()).toList(),
    };
  }
}

class GenderItem {
  int? id;
  String? name;
  String? altText;
  String? additional;
  String? encId;

  GenderItem({
    this.id,
    this.name,
    this.altText,
    this.additional,
    this.encId,
  });

  factory GenderItem.fromJson(Map<String, dynamic> json) {
    return GenderItem(
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
