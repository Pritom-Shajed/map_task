import 'package:get/get.dart';
import 'package:task/modules/home/home.dart';
import 'package:task/modules/search/search.dart';
import 'package:task/modules/splash/splash.dart';


part 'app_routes.dart';

class AppPages {
  static String INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    GetPage(
        name: Routes.HOME,
        page: () =>  HomePage(),
        binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.SEARCH,
      page: () =>  const SearchPage(),
      binding: SearchBinding(),
    ),
  ];
}