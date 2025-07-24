import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/service_locator.dart';
import 'package:weather/feature/job_application/presentation/logic/get_country/get_country_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_institution/get_institution_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_cubit.dart';
import 'package:weather/feature/job_application/presentation/widgets/application_stepper.dart';
import 'package:weather/feature/job_application/presentation/widgets/jop_description.dart';
import 'package:weather/core/widgets/home_app_bar.dart';
import 'package:weather/feature/job_application/presentation/logic/get_nationality/get_nationaltiy_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_gender/get_gender_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_material_status/get_material_status_cubit.dart';
import 'package:weather/feature/job_application/presentation/logic/get_visa_type/get_visa_type_cubit.dart';

class ApplyForJobView extends StatelessWidget {
  final String? jobTitleAlias;
  final String? jobTitle;

  const ApplyForJobView({super.key, this.jobTitleAlias, this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: JobApplicationProviders(
                  jobTitleAlias: jobTitleAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      JopDescription(),
                      SizedBox(height: 16),
                      ApplicationStepper(
                        jobTitleAlias: jobTitleAlias,
                        jobTitle: jobTitle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobApplicationProviders extends StatelessWidget {
  final String? jobTitleAlias;
  final Widget child;

  const JobApplicationProviders({
    super.key,
    this.jobTitleAlias,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetJobDetailsCubit>(
          create: (context) =>
              getit<GetJobDetailsCubit>()
                ..fetchJobDetails(jobTitleAlias ?? ''),
        ),
        BlocProvider<GetNationalityCubit>(
          create: (context) => getit<GetNationalityCubit>(),
        ),
        BlocProvider<GetGenderCubit>(
          create: (context) => getit<GetGenderCubit>(),
        ),
        BlocProvider<GetMaterialStatusCubit>(
          create: (context) => getit<GetMaterialStatusCubit>(),
        ),
        BlocProvider<GetVisaTypeCubit>(
          create: (context) => getit<GetVisaTypeCubit>(),
        ),
        BlocProvider<GetCountryCubit>(
          create: (context) => getit<GetCountryCubit>(),
        ),
        BlocProvider<GetInstitutionCubit>(
          create: (context) => getit<GetInstitutionCubit>(),
        ),
      ],
      child: child,
    );
  }
}
