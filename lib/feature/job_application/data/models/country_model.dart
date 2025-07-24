class CountryModel {
  CountryResult? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  CountryModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      result: json['result'] != null ? CountryResult.fromJson(json['result']) : null,
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

class CountryResult {
  int? total;
  List<CountryItem>? countries;

  CountryResult({this.total, this.countries});

  factory CountryResult.fromJson(Map<String, dynamic> json) {
    return CountryResult(
      total: json['total'],
      countries: json['results'] != null
          ? List<CountryItem>.from(json['results'].map((x) => CountryItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': countries?.map((x) => x.toJson()).toList(),
    };
  }
}

class CountryItem {
  int? id;
  String? name;
  String? altText;
  String? additional;
  String? encId;

  CountryItem({this.id, this.name, this.altText, this.additional, this.encId});

  factory CountryItem.fromJson(Map<String, dynamic> json) {
    return CountryItem(
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
