
import 'package:flutter/material.dart';
import 'package:monday15/controller/homescreencontroller.dart';
import 'package:monday15/view/splash/splashscreen.dart';
import 'package:provider/provider.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => HomeScreenController()),
    // ChangeNotifierProvider(create: (context) => SportsApiController(),)]
   ] ,child: MaterialApp(home: SplashScreen()));
  }
}