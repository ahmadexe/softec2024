import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:softec_app/configs/configs.dart';
import 'package:softec_app/firebase_options.dart';
import 'package:softec_app/router/router.dart';
// import 'package:softec_app/screens/home_screen.dart';
import 'configs/configs.dart' as theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // child: const HomeScreen(),
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        final navigatorKey = GlobalKey<NavigatorState>();
        final List<NavigatorObserver> observers = [];
        // App.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          builder: (context, child) {
            App.init(context);
            return child!;
          },
          theme: theme.themeDark,
          onGenerateRoute: onGenerateRoutes,
          navigatorKey: navigatorKey,
          navigatorObservers: [
            ...observers,
            NavigationHistoryObserver(),
          ],
          initialRoute: 'home',
          // You can use the library anywhere in the app even in theme
          // home: const HomeScreen(),
        );
      },
      // child: const HomePage(title: 'First Method'),
    );
  }
}