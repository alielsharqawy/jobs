// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:weather/core/di/service_locator.dart';
// import 'package:weather/feature/home/presentation/logic/get_logo/get_logo_cubit.dart';
// import 'package:weather/feature/home/presentation/logic/get_logo/get_logo_state.dart';

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getit<GetLogoCubit>()..getLogo(),
//       child: Row(
//         children: [
//           Image.asset('assets/images/jobs-logo.png', width: 200, height: 28),

//           Spacer(),
//           BlocBuilder<GetLogoCubit, GetLogoState>(
//             builder: (context, state) {
//               if (state is GetLogoLoaded) {
//                 final logoPath = state.logo.result?.tenantFilePath;
//                 if (logoPath != null && logoPath.isNotEmpty) {
//                   return Image.network(
//                     logoPath,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.contain,
//                   );
//                 }
//               }
//               return Icon(Icons.business, size: 40);
//             },
//           ),
//           Spacer(),
//           IconButton(
//             icon: Icon(Icons.language, size: 28),
//             onPressed: () {
//               if (context.locale == Locale('ar')) {
//                 context.setLocale(Locale('en'));
//               } else {
//                 context.setLocale(Locale('ar'));
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ), // For status bar height
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              // Logo
              Image.asset(
                'assets/images/jobs-logo.png',
                width: 120,
                height: 24,
                fit: BoxFit.contain,
              ),
              Spacer(),
              // Language Toggle Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.language_outlined,
                    size: 20,
                    color: Colors.grey.shade600,
                  ),
                  onPressed: () {
                    if (context.locale == Locale('ar')) {
                      context.setLocale(Locale('en'));
                    } else {
                      context.setLocale(Locale('ar'));
                    }
                  },
                  tooltip: context.locale == Locale('ar')
                      ? 'English'
                      : 'العربية',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
