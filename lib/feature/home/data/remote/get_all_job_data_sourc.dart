import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';
import 'package:weather/feature/home/data/models/logo_model.dart';

abstract class GetAllJobDataSourc {
  Future<GetAllJobs> getAllJobs();
  Future<LogoModel> getLogo();
}

class GetAllJobDataSourceImpl implements GetAllJobDataSourc {
  @override
  Future<GetAllJobs> getAllJobs() async {
    final url =
        "https://api.tenxerp.com/api/api/services/app/Vacancies/GetAllForPortal?skipcount=0&maxresultcount=9999&tenancyName=compassint";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = json.decode(response.body);
      return GetAllJobs.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load jobs: ${response.statusCode}');
    }
  }
  
  @override
  Future<LogoModel> getLogo() {
    final url = "https://api.tenxerp.com/api/api/services/app/Vacancies/GetTenantlogo?tenancyName=compassint";

    return http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = json.decode(response.body);
        return LogoModel.fromJson(jsonBody);
      } else {
        throw Exception('Failed to load logo: ${response.statusCode}');
      }
    });
  }
}
