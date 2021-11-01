import 'package:breaking_bad_app/utils/app_router.dart';
import 'package:breaking_bad_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(BreakingBadAppp(
    appRouter: AppRouter(),
  ));
}

class BreakingBadAppp extends StatelessWidget {
  final AppRouter appRouter;
  BreakingBadAppp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme,
    );
  }
}
