class LogoModel {
  LogoModelResult? result;
  Null targetUrl;
  bool? success;
  Null error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  LogoModel(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  LogoModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? LogoModelResult.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['targetUrl'] = targetUrl;
    data['success'] = success;
    data['error'] = error;
    data['unAuthorizedRequest'] = unAuthorizedRequest;
    data['__abp'] = bAbp;
    return data;
  }
}

class LogoModelResult {
  String? tenantLogoPath;
  String? tenantFilePath;
  Null listVacanciesKpi;

  LogoModelResult({this.tenantLogoPath, this.tenantFilePath, this.listVacanciesKpi});

  LogoModelResult.fromJson(Map<String, dynamic> json) {
    tenantLogoPath = json['tenantLogoPath'];
    tenantFilePath = json['tenantFilePath'];
    listVacanciesKpi = json['listVacanciesKpi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tenantLogoPath'] = tenantLogoPath;
    data['tenantFilePath'] = tenantFilePath;
    data['listVacanciesKpi'] = listVacanciesKpi;
    return data;
  }
}
