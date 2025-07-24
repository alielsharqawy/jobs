import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/di/service_locator.dart';
import 'package:weather/feature/job_application/presentation/views/apply_for_jop_view.dart';
import 'package:weather/feature/job_application/presentation/logic/get_job_details/get_job_details_cubit.dart';
import 'package:weather/feature/home/presentation/logic/get_all_jobs/get_all_jobs_cubit.dart';
import 'package:weather/feature/home/presentation/logic/get_all_jobs/get_all_jobs_state.dart';
import 'package:weather/feature/home/presentation/widgets/job_list_item.dart';

class JobsListView extends StatelessWidget {
  const JobsListView({super.key, required String searchQuery})
    : _searchQuery = searchQuery;

  final String _searchQuery;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllJobsCubit, GetAllJobsState>(
      builder: (context, state) {
        if (state is GetAllJobsLoading) {
          return SizedBox(
            height: 400,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is GetAllJobsError) {
          return SizedBox(
            height: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text('${"error".tr()}: ${state.message}'),
                ],
              ),
            ),
          );
        } else if (state is GetAllJobsLoaded) {
          final allJobs = state.jobs.result?.items ?? [];
          final jobsList = _searchQuery.isEmpty
              ? allJobs
              : allJobs.where((job) {
                  final title = (job.jobTitleAlias ?? '').toLowerCase();
                  final description = (job.jobDescription ?? '').toLowerCase();
                  return title.contains(_searchQuery) ||
                      description.contains(_searchQuery);
                }).toList();

          if (jobsList.isEmpty) {
            return SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _searchQuery.isEmpty ? Icons.work_off : Icons.search_off,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      _searchQuery.isEmpty
                          ? 'no_jobs_available'.tr()
                          : 'no_search_results'.tr(),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: jobsList.length,
            itemBuilder: (context, index) {
              final job = jobsList[index];
              return JobListItem(
                job: job,
                onApplyPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) =>
                            getit<GetJobDetailsCubit>()
                              ..fetchJobDetails(job.jobTitleAlias ?? ''),
                        child: ApplyForJobView(
                          jobTitleAlias: job.jobTitleAlias ?? '',
                          jobTitle: job.jobTitle ?? 'Unknown Job',
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        }

        return SizedBox(
          height: 400,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('loading_jobs'.tr()),
              ],
            ),
          ),
        );
      },
    );
  }
}
