import 'package:task/utils/constants/constants.dart';

class NavBarItem {
  final String title;
  final String iconPath;

  NavBarItem({required this.title, required this.iconPath});

  static List<NavBarItem> items = [
    NavBarItem(title: 'Barikoi Map', iconPath: AppSvgIcons.map),
    NavBarItem(title: 'Saved', iconPath: AppSvgIcons.saved),
  ];
}