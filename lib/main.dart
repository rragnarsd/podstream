import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podstream/routes/app_router.dart';
import 'package:podstream/utils/constants/pod_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Podstream',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: PodColors.textColor,
            displayColor: PodColors.textColor,
          ),
        ),

        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
