class NationalityModel {
  NationalityResult? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  NationalityModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory NationalityModel.fromJson(Map<String, dynamic> json) {
    return NationalityModel(
      result: json['result'] != null ? NationalityResult.fromJson(json['result']) : null,
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

class NationalityResult {
  int? total;
  List<NationalityItem>? nationalities;

  NationalityResult({this.total, this.nationalities});

  factory NationalityResult.fromJson(Map<String, dynamic> json) {
    return NationalityResult(
      total: json['total'],
      nationalities: json['results'] != null
          ? List<NationalityItem>.from(json['results'].map((x) => NationalityItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': nationalities?.map((x) => x.toJson()).toList(),
    };
  }
}

class NationalityItem {
  int? id;
  String? name;
  String? altText;
  String? additional;
  String? encId;

  NationalityItem({
    this.id,
    this.name,
    this.altText,
    this.additional,
    this.encId,
  });

  factory NationalityItem.fromJson(Map<String, dynamic> json) {
    return NationalityItem(
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
