import 'package:get/get.dart';
import 'package:test_app/app/data/routes/app_routes.dart';
import 'package:test_app/app/screens/calculator/calculator.dart';
import 'package:test_app/app/screens/home/home.dart';
import 'package:test_app/app/screens/weather/screen.dart';


import '../../screens/dashboard/dashboard.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const Dashboard(),
      bindings: [
        DashboardBinding(),
      ],
    ),
    GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AppRoutes.calculator, page: () => const CalculatorScreen()),
    GetPage(name: AppRoutes.weather, page: () => const WeatherScreen()),
  ];
}
