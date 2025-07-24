import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/constant/app_functions.dart';
import 'package:weather/core/di/service_locator.dart';
import 'package:weather/feature/home/data/models/get_all_jobs_model.dart';

class JobListItem extends StatelessWidget {
  final GetAllJobsItems job;
  final VoidCallback onApplyPressed;

  const JobListItem({
    super.key,
    required this.job,
    required this.onApplyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 12.0,
          bottom: 24.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                job.jobTitle ?? "no_title".tr(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              getit<AppFunctions>().cleanHtmlText(job.jobDescription ?? ""),
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: onApplyPressed,
              label: Text("apply".tr()),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
