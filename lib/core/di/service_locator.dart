import 'package:get_it/get_it.dart';
import 'package:weather/core/constant/app_functions.dart';
import 'package:weather/feature/job_application/domain/usecase/get_job_details_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_cubit.dart';
import 'package:weather/feature/home/data/remote/get_all_job_data_sourc.dart';
import 'package:weather/feature/home/data/repository/get_all_jops_repo_impl.dart';
import 'package:weather/feature/home/domain/repository/get_all_jobs_repo.dart';
import 'package:weather/feature/home/domain/usecase/get_all_jobs_uc.dart';
import 'package:weather/feature/home/domain/usecase/get_logo_uc.dart';
import 'package:weather/feature/home/presentation/logic/get_all_jobs/get_all_jobs_cubit.dart';
import 'package:weather/feature/home/presentation/logic/get_logo/get_logo_cubit.dart';

// Apply for job imports
import 'package:weather/feature/job_application/data/remote/apply_application_data_source.dart';
import 'package:weather/feature/job_application/data/repo/apply_application_repo_impl.dart';
import 'package:weather/feature/job_application/domain/repo/apply_application_repo.dart';
import 'package:weather/feature/job_application/domain/usecase/get_country_uc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_gender_uc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_institution_uc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_material_status_uc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_nationality_uc.dart';
import 'package:weather/feature/job_application/domain/usecase/get_visa_type_uc.dart';
import 'package:weather/feature/job_application/presentation/logic/get_country/get_country_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_gender/get_gender_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_institution/get_institution_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_material_status/get_material_status_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_nationality/get_nationaltiy_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_visa_type/get_visa_type_cubit.dart';

final getit = GetIt.instance;

void setupServiceLocator() {

  // Core feature registrations
  getit.registerLazySingleton<AppFunctions>(
    () => AppFunctions(),
  );

  // Home feature registrations
  getit.registerLazySingleton<GetAllJobDataSourc>(
    () => GetAllJobDataSourceImpl(),
  );

  getit.registerFactory<GetAllJobsRepo>(
    () => GetAllJobsRepoImpl(getit<GetAllJobDataSourc>()),
  );

  // Apply for job feature registrations
  getit.registerLazySingleton<ApplyApplicationDataSource>(
    () => ApplyApplicationDataSourceImpl(),
  );

  getit.registerFactory<ApplyApplicationRepository>(
    () => ApplyApplicationRepositoryImpl(getit<ApplyApplicationDataSource>()),
  );

  ///////////// Register Use Cases /////////////
  // Home use cases
  getit.registerFactory(() => GetAllJobsUC(getit()));
  getit.registerFactory(() => GetLogoUC(getit()));

  // Apply for job use cases
  getit.registerFactory(() => GetJobDetailsUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetCountryUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetGenderUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetInstitutionTypeUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetMaritalStatusUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetNationalityUseCase(getit<ApplyApplicationRepository>()));
  getit.registerFactory(() => GetVisaTypeUseCase(getit<ApplyApplicationRepository>()));

  ///////////////// Register Cubits /////////////
  // Home cubits
  getit.registerFactory(() => GetAllJobsCubit(getit()));
  getit.registerFactory(() => GetLogoCubit(getit()));

  // Apply for job cubits

  getit.registerFactory(() => GetJobDetailsCubit(getit()));
  getit.registerFactory(() => GetCountryCubit(getit()));
  getit.registerFactory(() => GetGenderCubit(getit()));
  getit.registerFactory(() => GetInstitutionCubit(getit()));
  getit.registerFactory(() => GetMaterialStatusCubit(getit()));
  getit.registerFactory(() => GetNationalityCubit(getit()));
  getit.registerFactory(() => GetVisaTypeCubit(getit()));
}
