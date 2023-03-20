import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.h),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/image/home.svg',
            height: 30.h,
          ),
          SizedBox(height: 2.h),
          CustomText(
            'Multimedia Instructional Materials in Speaking for Grade 8',
            size: 20.sp,
            textAlign: TextAlign.center,
            weight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
