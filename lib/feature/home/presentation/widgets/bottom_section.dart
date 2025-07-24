import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/feature/home/presentation/widgets/email_and_subscribe_button.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            "subscribe_title".tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text("subscribe_description".tr()),
          SizedBox(height: 8),
          EmailAndSubscribeButton(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
