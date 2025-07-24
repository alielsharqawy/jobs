class JobDetailsModel {
  JobDetails? result;
  String? targetUrl;
  bool? success;
  dynamic error;
  bool? unAuthorizedRequest;
  bool? abp;

  JobDetailsModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) {
    return JobDetailsModel(
      result: json['result'] != null ? JobDetails.fromJson(json['result']) : null,
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

class JobDetails {
  String? encId;
  String? jobTitleAlias;
  String? jobTitle;
  int? numberOfOpeningLkpId;
  LookupItem? fndNumberOfOpeningLKp;
  String? jobLocation;
  int? showPayByLkpId;
  dynamic fndShowPayByLKp;
  double? minimum;
  double? maximum;
  int? rateLkpId;
  dynamic fndRateLKp;
  double? amount;
  int? showByLkpId;
  dynamic fndShowByLKp;
  double? fixedAt;
  double? from;
  double? to;
  double? noMoreThan;
  double? noLessThan;
  int? qualificationLkpId;
  LookupItem? fndQualificationLKp;
  int? jObTypeLkpId;
  LookupItem? fndJObTypeLKp;
  bool? visa;
  String? question1;
  String? question2;
  String? question3;
  int? vacancyId;
  String? jobDescription;
  String? experience;
  int? statusLkpId;
  LookupItem? fndStatusLkp;
  int? jobLocationkpId;
  LookupItem? fndJobLocationkpIdLkp;
  int? hourLkpId;
  dynamic fndHourLkp;
  int? status;
  String? message;
  int? postUserId;
  String? postTime;
  int? unPostUserId;
  String? unPostTime;
  String? lastModificationTime;
  int? lastModifierUserId;
  String? creationTime;
  int? creatorUserId;
  int? id;

  JobDetails({
    this.encId,
    this.jobTitleAlias,
    this.jobTitle,
    this.numberOfOpeningLkpId,
    this.fndNumberOfOpeningLKp,
    this.jobLocation,
    this.showPayByLkpId,
    this.fndShowPayByLKp,
    this.minimum,
    this.maximum,
    this.rateLkpId,
    this.fndRateLKp,
    this.amount,
    this.showByLkpId,
    this.fndShowByLKp,
    this.fixedAt,
    this.from,
    this.to,
    this.noMoreThan,
    this.noLessThan,
    this.qualificationLkpId,
    this.fndQualificationLKp,
    this.jObTypeLkpId,
    this.fndJObTypeLKp,
    this.visa,
    this.question1,
    this.question2,
    this.question3,
    this.vacancyId,
    this.jobDescription,
    this.experience,
    this.statusLkpId,
    this.fndStatusLkp,
    this.jobLocationkpId,
    this.fndJobLocationkpIdLkp,
    this.hourLkpId,
    this.fndHourLkp,
    this.status,
    this.message,
    this.postUserId,
    this.postTime,
    this.unPostUserId,
    this.unPostTime,
    this.lastModificationTime,
    this.lastModifierUserId,
    this.creationTime,
    this.creatorUserId,
    this.id,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) {
    return JobDetails(
      encId: json['encId'],
      jobTitleAlias: json['jobTitleAlias'],
      jobTitle: json['jobTitle'],
      numberOfOpeningLkpId: json['numberOfOpeningLkpId'],
      fndNumberOfOpeningLKp: json['fndNumberOfOpeningLKp'] != null
          ? LookupItem.fromJson(json['fndNumberOfOpeningLKp'])
          : null,
      jobLocation: json['jobLocation'],
      showPayByLkpId: json['showPayByLkpId'],
      fndShowPayByLKp: json['fndShowPayByLKp'],
      minimum: (json['minimum'] as num?)?.toDouble(),
      maximum: (json['maximum'] as num?)?.toDouble(),
      rateLkpId: json['rateLkpId'],
      fndRateLKp: json['fndRateLKp'],
      amount: (json['amount'] as num?)?.toDouble(),
      showByLkpId: json['showByLkpId'],
      fndShowByLKp: json['fndShowByLKp'],
      fixedAt: (json['fixedAt'] as num?)?.toDouble(),
      from: (json['from'] as num?)?.toDouble(),
      to: (json['to'] as num?)?.toDouble(),
      noMoreThan: (json['noMoreThan'] as num?)?.toDouble(),
      noLessThan: (json['noLessThan'] as num?)?.toDouble(),
      qualificationLkpId: json['qualificationLkpId'],
      fndQualificationLKp: json['fndQualificationLKp'] != null
          ? LookupItem.fromJson(json['fndQualificationLKp'])
          : null,
      jObTypeLkpId: json['jObTypeLkpId'],
      fndJObTypeLKp: json['fndJObTypeLKp'] != null
          ? LookupItem.fromJson(json['fndJObTypeLKp'])
          : null,
      visa: json['visa'],
      question1: json['question1'],
      question2: json['question2'],
      question3: json['question3'],
      vacancyId: json['vacancyId'],
      jobDescription: json['jobDescription'],
      experience: json['experience'],
      statusLkpId: json['statusLkpId'],
      fndStatusLkp: json['fndStatusLkp'] != null
          ? LookupItem.fromJson(json['fndStatusLkp'])
          : null,
      jobLocationkpId: json['jobLocationkpId'],
      fndJobLocationkpIdLkp: json['fndJobLocationkpIdLkp'] != null
          ? LookupItem.fromJson(json['fndJobLocationkpIdLkp'])
          : null,
      hourLkpId: json['hourLkpId'],
      fndHourLkp: json['fndHourLkp'],
      status: json['status'],
      message: json['message'],
      postUserId: json['postUserId'],
      postTime: json['postTime'],
      unPostUserId: json['unPostUserId'],
      unPostTime: json['unPostTime'],
      lastModificationTime: json['lastModificationTime'],
      lastModifierUserId: json['lastModifierUserId'],
      creationTime: json['creationTime'],
      creatorUserId: json['creatorUserId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'encId': encId,
      'jobTitleAlias': jobTitleAlias,
      'jobTitle': jobTitle,
      'numberOfOpeningLkpId': numberOfOpeningLkpId,
      'fndNumberOfOpeningLKp': fndNumberOfOpeningLKp?.toJson(),
      'jobLocation': jobLocation,
      'showPayByLkpId': showPayByLkpId,
      'fndShowPayByLKp': fndShowPayByLKp,
      'minimum': minimum,
      'maximum': maximum,
      'rateLkpId': rateLkpId,
      'fndRateLKp': fndRateLKp,
      'amount': amount,
      'showByLkpId': showByLkpId,
      'fndShowByLKp': fndShowByLKp,
      'fixedAt': fixedAt,
      'from': from,
      'to': to,
      'noMoreThan': noMoreThan,
      'noLessThan': noLessThan,
      'qualificationLkpId': qualificationLkpId,
      'fndQualificationLKp': fndQualificationLKp?.toJson(),
      'jObTypeLkpId': jObTypeLkpId,
      'fndJObTypeLKp': fndJObTypeLKp?.toJson(),
      'visa': visa,
      'question1': question1,
      'question2': question2,
      'question3': question3,
      'vacancyId': vacancyId,
      'jobDescription': jobDescription,
      'experience': experience,
      'statusLkpId': statusLkpId,
      'fndStatusLkp': fndStatusLkp?.toJson(),
      'jobLocationkpId': jobLocationkpId,
      'fndJobLocationkpIdLkp': fndJobLocationkpIdLkp?.toJson(),
      'hourLkpId': hourLkpId,
      'fndHourLkp': fndHourLkp,
      'status': status,
      'message': message,
      'postUserId': postUserId,
      'postTime': postTime,
      'unPostUserId': unPostUserId,
      'unPostTime': unPostTime,
      'lastModificationTime': lastModificationTime,
      'lastModifierUserId': lastModifierUserId,
      'creationTime': creationTime,
      'creatorUserId': creatorUserId,
      'id': id,
    };
  }
}

class LookupItem {
  String? nameEn;
  String? nameAr;
  String? lookupCode;
  String? lookupType;
  bool? yesNo;
  String? addedValues;
  String? lastModificationTime;
  int? lastModifierUserId;
  String? creationTime;
  int? creatorUserId;
  int? id;

  LookupItem({
    this.nameEn,
    this.nameAr,
    this.lookupCode,
    this.lookupType,
    this.yesNo,
    this.addedValues,
    this.lastModificationTime,
    this.lastModifierUserId,
    this.creationTime,
    this.creatorUserId,
    this.id,
  });

  factory LookupItem.fromJson(Map<String, dynamic> json) {
    return LookupItem(
      nameEn: json['nameEn'],
      nameAr: json['nameAr'],
      lookupCode: json['lookupCode'],
      lookupType: json['lookupType'],
      yesNo: json['yesNo'],
      addedValues: json['addedValues'],
      lastModificationTime: json['lastModificationTime'],
      lastModifierUserId: json['lastModifierUserId'],
      creationTime: json['creationTime'],
      creatorUserId: json['creatorUserId'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameEn': nameEn,
      'nameAr': nameAr,
      'lookupCode': lookupCode,
      'lookupType': lookupType,
      'yesNo': yesNo,
      'addedValues': addedValues,
      'lastModificationTime': lastModificationTime,
      'lastModifierUserId': lastModifierUserId,
      'creationTime': creationTime,
      'creatorUserId': creatorUserId,
      'id': id,
    };
  }
}
