import 'package:bazaarboxapp/providers/add_item_provider.dart';
import 'package:bazaarboxapp/providers/home_provider.dart';
import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/providers/search_provider.dart';
import 'package:bazaarboxapp/providers/update_item_provider.dart';
import 'package:bazaarboxapp/views/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => BottomNavigationBarProvider()),
          ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
          ChangeNotifierProvider(create: (context) => SearchScreenProvider()),
          ChangeNotifierProvider(create: (context) => AddItemScreenProvider()),
          ChangeNotifierProvider(
              create: (context) => UpdateItemScreenProvider())
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MainScreen();
        }),
      ),
    );
  }
}
