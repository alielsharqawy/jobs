class InstitutionTypeModel {
  final InstitutionTypeResult? result;
  final String? targetUrl;
  final bool? success;
  final dynamic error;
  final bool? unAuthorizedRequest;
  final bool? abp;

  InstitutionTypeModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory InstitutionTypeModel.fromJson(Map<String, dynamic> json) {
    return InstitutionTypeModel(
      result: json['result'] != null ? InstitutionTypeResult.fromJson(json['result']) : null,
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

class InstitutionTypeResult {
  final int? total;
  final List<InstitutionTypeItem>? results;

  InstitutionTypeResult({this.total, this.results});

  factory InstitutionTypeResult.fromJson(Map<String, dynamic> json) {
    return InstitutionTypeResult(
      total: json['total'],
      results: json['results'] != null
          ? List<InstitutionTypeItem>.from(json['results'].map((x) => InstitutionTypeItem.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'results': results?.map((x) => x.toJson()).toList(),
    };
  }
}

class InstitutionTypeItem {
  final int? id;
  final String? text;
  final String? altText;
  final String? additional;
  final String? encId;

  InstitutionTypeItem({this.id, this.text, this.altText, this.additional, this.encId});

  factory InstitutionTypeItem.fromJson(Map<String, dynamic> json) {
    return InstitutionTypeItem(
      id: json['id'],
      text: json['text'],
      altText: json['altText'],
      additional: json['additional'],
      encId: json['encId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'altText': altText,
      'additional': additional,
      'encId': encId,
    };
  }
}
