import 'package:get/get.dart';
import 'package:task/modules/home/home.dart';
import 'package:task/modules/search/search.dart';
import 'package:task/modules/splash/splash.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();
  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
        name: Routes.HOME,
        page: () =>  const HomePage(),
        binding: HomeBinding(),
    ),

    GetPage(
      transition: Transition.fade,
      name: Routes.SEARCH,
      page: () =>  const SearchPage(),
      binding: SearchBinding(),
    ),
  ];
}