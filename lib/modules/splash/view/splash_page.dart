import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/components/global_widgets/global_widgets.dart';
import 'package:task/utils/constants/constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(iconPath: AppSvgIcons.map, color: AppColors.primaryColor, size: 45.w,),

            14.verticalSpace,
            AppLoaders.spinningLines()
          ],
        ),
      ),
    );
  }
}