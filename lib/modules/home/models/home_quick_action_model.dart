import 'package:task/utils/constants/constants.dart';

class QuickActionItem {
  final String title;
  final String iconPath;

  QuickActionItem({required this.title, required this.iconPath});

  static List<QuickActionItem> items = [
    QuickActionItem(title: 'ATM', iconPath: AppSvgIcons.atm),
    QuickActionItem(title: 'School', iconPath: AppSvgIcons.school),
    QuickActionItem(title: 'Hospital', iconPath: AppSvgIcons.hospital),
    QuickActionItem(title: 'Bank', iconPath: AppSvgIcons.bank),
  ];
}