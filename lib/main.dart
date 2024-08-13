import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:measure/providers/area_provider.dart';
import 'package:measure/providers/tab_provider.dart';
import 'package:measure/ui/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TabProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AreaProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Measure',
        theme: ThemeData(
          fontFamily: "Urbanist",
        ),
        home: const HomePage(),
      ),
    );
  }
}
