import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeDescription extends StatelessWidget {
  const HomeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "hello_msg".tr(),
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
