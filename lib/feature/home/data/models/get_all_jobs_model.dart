// ignore_for_file: unnecessary_this

class GetAllJobs {
  GetAllJobsResult? result;
  Null targetUrl;
  bool? success;
  Null error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  GetAllJobs(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  GetAllJobs.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? GetAllJobsResult.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'];
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['targetUrl'] = this.targetUrl;
    data['success'] = this.success;
    data['error'] = this.error;
    data['unAuthorizedRequest'] = this.unAuthorizedRequest;
    data['__abp'] = this.bAbp;
    return data;
  }
}

class GetAllJobsResult {
  int? totalCount;
  List<GetAllJobsItems>? items;

  GetAllJobsResult({this.totalCount, this.items});

  GetAllJobsResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'] is double 
        ? (json['totalCount'] as double).toInt() 
        : json['totalCount'];
    if (json['items'] != null) {
      items = <GetAllJobsItems>[];
      json['items'].forEach((v) {
        items!.add(GetAllJobsItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = this.totalCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllJobsItems {
  String? encId;
  String? jobTitleAlias;
  String? jobTitle;
  int? numberOfOpeningLkpId;
  Null fndNumberOfOpeningLKp;
  String? jobLocation;
  Null showPayByLkpId;
  Null fndShowPayByLKp;
  Null minimum;
  Null maximum;
  Null rateLkpId;
  Null fndRateLKp;
  Null amount;
  Null showByLkpId;
  Null fndShowByLKp;
  Null fixedAt;
  int? from;
  int? to;
  Null noMoreThan;
  Null noLessThan;
  int? qualificationLkpId;
  FndQualificationLKp? fndQualificationLKp;
  int? jObTypeLkpId;
  FndQualificationLKp? fndJObTypeLKp;
  bool? visa;
  String? question1;
  String? question2;
  String? question3;
  Null vacancyId;
  String? jobDescription;
  String? experience;
  int? statusLkpId;
  FndStatusLkp? fndStatusLkp;
  int? jobLocationkpId;
  FndJobLocationkpIdLkp? fndJobLocationkpIdLkp;
  Null hourLkpId;
  Null fndHourLkp;
  int? status;
  Null message;
  Null postUserId;
  Null postTime;
  Null unPostUserId;
  Null unPostTime;
  String? lastModificationTime;
  int? lastModifierUserId;
  String? creationTime;
  int? creatorUserId;
  int? id;

  GetAllJobsItems(
      {this.encId,
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
      this.id});

  GetAllJobsItems.fromJson(Map<String, dynamic> json) {
    encId = json['encId'];
    jobTitleAlias = json['jobTitleAlias'];
    jobTitle = json['jobTitle'];
    numberOfOpeningLkpId = json['numberOfOpeningLkpId'] is double 
        ? (json['numberOfOpeningLkpId'] as double).toInt() 
        : json['numberOfOpeningLkpId'];
    fndNumberOfOpeningLKp = json['fndNumberOfOpeningLKp'];
    jobLocation = json['jobLocation'];
    showPayByLkpId = json['showPayByLkpId'];
    fndShowPayByLKp = json['fndShowPayByLKp'];
    minimum = json['minimum'];
    maximum = json['maximum'];
    rateLkpId = json['rateLkpId'];
    fndRateLKp = json['fndRateLKp'];
    amount = json['amount'];
    showByLkpId = json['showByLkpId'];
    fndShowByLKp = json['fndShowByLKp'];
    fixedAt = json['fixedAt'];
    from = json['from'] is double 
        ? (json['from'] as double).toInt() 
        : json['from'];
    to = json['to'] is double 
        ? (json['to'] as double).toInt() 
        : json['to'];
    noMoreThan = json['noMoreThan'];
    noLessThan = json['noLessThan'];
    qualificationLkpId = json['qualificationLkpId'] is double 
        ? (json['qualificationLkpId'] as double).toInt() 
        : json['qualificationLkpId'];
    fndQualificationLKp = json['fndQualificationLKp'] != null
        ? FndQualificationLKp.fromJson(json['fndQualificationLKp'])
        : null;
    jObTypeLkpId = json['jObTypeLkpId'] is double 
        ? (json['jObTypeLkpId'] as double).toInt() 
        : json['jObTypeLkpId'];
    fndJObTypeLKp = json['fndJObTypeLKp'] != null
        ? FndQualificationLKp.fromJson(json['fndJObTypeLKp'])
        : null;
    visa = json['visa'];
    question1 = json['question1'];
    question2 = json['question2'];
    question3 = json['question3'];
    vacancyId = json['vacancyId'];
    jobDescription = json['jobDescription'];
    experience = json['experience'];
    statusLkpId = json['statusLkpId'] is double 
        ? (json['statusLkpId'] as double).toInt() 
        : json['statusLkpId'];
    fndStatusLkp = json['fndStatusLkp'] != null
        ? FndStatusLkp.fromJson(json['fndStatusLkp'])
        : null;
    jobLocationkpId = json['jobLocationkpId'] is double 
        ? (json['jobLocationkpId'] as double).toInt() 
        : json['jobLocationkpId'];
    fndJobLocationkpIdLkp = json['fndJobLocationkpIdLkp'] != null
        ? FndJobLocationkpIdLkp.fromJson(json['fndJobLocationkpIdLkp'])
        : null;
    hourLkpId = json['hourLkpId'];
    fndHourLkp = json['fndHourLkp'];
    status = json['status'] is double 
        ? (json['status'] as double).toInt() 
        : json['status'];
    message = json['message'];
    postUserId = json['postUserId'];
    postTime = json['postTime'];
    unPostUserId = json['unPostUserId'];
    unPostTime = json['unPostTime'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'] is double 
        ? (json['lastModifierUserId'] as double).toInt() 
        : json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'] is double 
        ? (json['creatorUserId'] as double).toInt() 
        : json['creatorUserId'];
    id = json['id'] is double 
        ? (json['id'] as double).toInt() 
        : json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['encId'] = this.encId;
    data['jobTitleAlias'] = this.jobTitleAlias;
    data['jobTitle'] = this.jobTitle;
    data['numberOfOpeningLkpId'] = this.numberOfOpeningLkpId;
    data['fndNumberOfOpeningLKp'] = this.fndNumberOfOpeningLKp;
    data['jobLocation'] = this.jobLocation;
    data['showPayByLkpId'] = this.showPayByLkpId;
    data['fndShowPayByLKp'] = this.fndShowPayByLKp;
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    data['rateLkpId'] = this.rateLkpId;
    data['fndRateLKp'] = this.fndRateLKp;
    data['amount'] = this.amount;
    data['showByLkpId'] = this.showByLkpId;
    data['fndShowByLKp'] = this.fndShowByLKp;
    data['fixedAt'] = this.fixedAt;
    data['from'] = this.from;
    data['to'] = this.to;
    data['noMoreThan'] = this.noMoreThan;
    data['noLessThan'] = this.noLessThan;
    data['qualificationLkpId'] = this.qualificationLkpId;
    if (this.fndQualificationLKp != null) {
      data['fndQualificationLKp'] = this.fndQualificationLKp!.toJson();
    }
    data['jObTypeLkpId'] = this.jObTypeLkpId;
    if (this.fndJObTypeLKp != null) {
      data['fndJObTypeLKp'] = this.fndJObTypeLKp!.toJson();
    }
    data['visa'] = this.visa;
    data['question1'] = this.question1;
    data['question2'] = this.question2;
    data['question3'] = this.question3;
    data['vacancyId'] = this.vacancyId;
    data['jobDescription'] = this.jobDescription;
    data['experience'] = this.experience;
    data['statusLkpId'] = this.statusLkpId;
    if (this.fndStatusLkp != null) {
      data['fndStatusLkp'] = this.fndStatusLkp!.toJson();
    }
    data['jobLocationkpId'] = this.jobLocationkpId;
    if (this.fndJobLocationkpIdLkp != null) {
      data['fndJobLocationkpIdLkp'] = this.fndJobLocationkpIdLkp!.toJson();
    }
    data['hourLkpId'] = this.hourLkpId;
    data['fndHourLkp'] = this.fndHourLkp;
    data['status'] = this.status;
    data['message'] = this.message;
    data['postUserId'] = this.postUserId;
    data['postTime'] = this.postTime;
    data['unPostUserId'] = this.unPostUserId;
    data['unPostTime'] = this.unPostTime;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

class FndQualificationLKp {
  String? nameEn;
  String? nameAr;
  String? lookupCode;
  String? lookupType;
  bool? yesNo;
  Null addedValues;
  String? lastModificationTime;
  int? lastModifierUserId;
  String? creationTime;
  Null creatorUserId;
  int? id;

  FndQualificationLKp(
      {this.nameEn,
      this.nameAr,
      this.lookupCode,
      this.lookupType,
      this.yesNo,
      this.addedValues,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.creationTime,
      this.creatorUserId,
      this.id});

  FndQualificationLKp.fromJson(Map<String, dynamic> json) {
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    lookupCode = json['lookupCode'];
    lookupType = json['lookupType'];
    yesNo = json['yesNo'];
    addedValues = json['addedValues'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'] is double 
        ? (json['lastModifierUserId'] as double).toInt() 
        : json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'] is double 
        ? (json['creatorUserId'] as double).toInt() 
        : json['creatorUserId'];
    id = json['id'] is double 
        ? (json['id'] as double).toInt() 
        : json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['lookupCode'] = this.lookupCode;
    data['lookupType'] = this.lookupType;
    data['yesNo'] = this.yesNo;
    data['addedValues'] = this.addedValues;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

class FndStatusLkp {
  String? nameEn;
  String? nameAr;
  String? lookupCode;
  String? lookupType;
  bool? yesNo;
  Null addedValues;
  Null lastModificationTime;
  Null lastModifierUserId;
  String? creationTime;
  Null creatorUserId;
  int? id;

  FndStatusLkp(
      {this.nameEn,
      this.nameAr,
      this.lookupCode,
      this.lookupType,
      this.yesNo,
      this.addedValues,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.creationTime,
      this.creatorUserId,
      this.id});

  FndStatusLkp.fromJson(Map<String, dynamic> json) {
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    lookupCode = json['lookupCode'];
    lookupType = json['lookupType'];
    yesNo = json['yesNo'];
    addedValues = json['addedValues'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'] is double 
        ? (json['lastModifierUserId'] as double).toInt() 
        : json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'] is double 
        ? (json['creatorUserId'] as double).toInt() 
        : json['creatorUserId'];
    id = json['id'] is double 
        ? (json['id'] as double).toInt() 
        : json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['lookupCode'] = this.lookupCode;
    data['lookupType'] = this.lookupType;
    data['yesNo'] = this.yesNo;
    data['addedValues'] = this.addedValues;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}

class FndJobLocationkpIdLkp {
  String? nameEn;
  String? nameAr;
  String? lookupCode;
  String? lookupType;
  bool? yesNo;
  String? addedValues;
  String? lastModificationTime;
  int? lastModifierUserId;
  String? creationTime;
  Null creatorUserId;
  int? id;

  FndJobLocationkpIdLkp(
      {this.nameEn,
      this.nameAr,
      this.lookupCode,
      this.lookupType,
      this.yesNo,
      this.addedValues,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.creationTime,
      this.creatorUserId,
      this.id});

  FndJobLocationkpIdLkp.fromJson(Map<String, dynamic> json) {
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    lookupCode = json['lookupCode'];
    lookupType = json['lookupType'];
    yesNo = json['yesNo'];
    addedValues = json['addedValues'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'] is double 
        ? (json['lastModifierUserId'] as double).toInt() 
        : json['lastModifierUserId'];
    creationTime = json['creationTime'];
    creatorUserId = json['creatorUserId'] is double 
        ? (json['creatorUserId'] as double).toInt() 
        : json['creatorUserId'];
    id = json['id'] is double 
        ? (json['id'] as double).toInt() 
        : json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['lookupCode'] = this.lookupCode;
    data['lookupType'] = this.lookupType;
    data['yesNo'] = this.yesNo;
    data['addedValues'] = this.addedValues;
    data['lastModificationTime'] = this.lastModificationTime;
    data['lastModifierUserId'] = this.lastModifierUserId;
    data['creationTime'] = this.creationTime;
    data['creatorUserId'] = this.creatorUserId;
    data['id'] = this.id;
    return data;
  }
}
