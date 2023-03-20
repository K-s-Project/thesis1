import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thesis1/core/constants/defaults.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/core/utils/custom_functions.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

import '../../state/user/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      bloc: context.read<UserCubit>()
        ..onFetchUserById(id: FirebaseAuth.instance.currentUser?.uid ?? ''),
      builder: (context, state) {
        if (state is UserLoaded) {
          final user = state.student;
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 26.h,
                  width: 100.w,
                  padding: EdgeInsets.all(1.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300,
                            ),
                            child: user.imageUrl == null
                                ? CustomText(
                                    user.firstName.characters.first,
                                    size: 20.sp,
                                    color: Theme.of(context).primaryColor,
                                    weight: FontWeight.bold,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: user.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                            top: -2.h,
                            right: -4.w,
                            child: IconButton(
                              tooltip: 'Edit profile',
                              color: Colors.black,
                              onPressed: () {
                                AutoRouter.of(context)
                                    .push(EditProfileRoute(student: user));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        '${user.firstName} ${user.lastName}',
                        color: Colors.white,
                        size: 18.sp,
                      ),
                      CustomText(
                        user.email,
                        color: Colors.white,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.all(DEFAULT_PADDING.h),
                  child: Column(
                    children: [
                      CustomTextfield(
                        'Grade',
                        readOnly: true,
                        label: const CustomText('Grade'),
                        initialValue: user.grade,
                      ),
                      SizedBox(height: 1.h),
                      CustomTextfield(
                        'Section',
                        readOnly: true,
                        label: const CustomText('Section'),
                        initialValue: user.section,
                      ),
                      SizedBox(height: 1.h),
                      CustomTextfield(
                        'LRN',
                        readOnly: true,
                        label: const CustomText('LRN'),
                        initialValue: user.lrn,
                      ),
                      SizedBox(height: 1.h),
                      CustomElevatedButton(
                        'Logout',
                        bgColor: Theme.of(context).primaryColor,
                        color: Colors.white,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const CustomText('Logout'),
                                  content: const CustomText(
                                      'Are you sure you want to logout?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const CustomText('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        CustomFunctions.logout().then(
                                            (value) => Navigator.pop(context));
                                      },
                                      child: const CustomText('Logout'),
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is UserLoading) {
          return Column(
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 26.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 2.h),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 2.h),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 2.h),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ),
              SizedBox(height: 2.h),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Container(
                  height: 6.h,
                  width: 100.w,
                  color: Colors.grey.shade200,
                ),
              ),
            ],
          );
        } else if (state is UserError) {
          return const Center(
            child: CustomText('Ooops...'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
