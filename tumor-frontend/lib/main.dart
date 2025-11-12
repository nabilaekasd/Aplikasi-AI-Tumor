import 'package:axon_vision/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'utils/size_config.dart';

void main() {
  runApp(const AxonVision());
}

class AxonVision extends StatelessWidget {
  const AxonVision({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp.router(
      theme: ThemeData(useMaterial3: false),
      title: 'Axon Vision',
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('id'), // Indonesia
        Locale('en'), // English
      ],
    );
  }
}
