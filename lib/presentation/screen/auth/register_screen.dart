import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/constants/defaults.dart';
import 'package:thesis1/core/constants/strings.dart';
import 'package:thesis1/domain/entity/student_entity.dart';
import 'package:thesis1/presentation/state/auths/register/register_cubit.dart';
import 'package:thesis1/presentation/state/basics/section_dd/section_dd_cubit.dart';
import 'package:thesis1/presentation/state/user/user_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final grade = TextEditingController();
  final lrn = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  //*formkeys
  final emailkey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
    grade.dispose();
    lrn.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final section = context.select((SectionDdCubit section) => section.state);
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(DEFAULT_PADDING.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Register',
                    size: 24.sp,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    'Student Info',
                    size: 16.sp,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'First Name',
                    controller: firstName,
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Last Name',
                    controller: lastName,
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextfield(
                          'Grade',
                          controller: grade,
                          keyboard: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(1.h),
                          height: 7.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                            underline: const SizedBox.shrink(),
                            hint: const CustomText('Section'),
                            isExpanded: true,
                            value: section,
                            items: sections
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: CustomText(e),
                                    ))
                                .toList(),
                            onChanged: (v) {
                              context.read<SectionDdCubit>().pickSection(v!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'LRN Number',
                    controller: lrn,
                    keyboard: TextInputType.number,
                  ),
                  const Divider(),
                  CustomText(
                    'Account Info',
                    size: 16.sp,
                  ),
                  CustomTextfield(
                    'Email',
                    controller: email,
                    formKey: emailkey,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please Enter a Valid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Password',
                    controller: password,
                    formKey: passwordKey,
                    validator: (value) {
                      String missings = "";
                      if (value!.isEmpty) {
                        missings += 'Please enter a password\n';
                      }
                      if (value.length < 8) {
                        missings += "Password has at least 8 characters\n";
                      }

                      if (!RegExp("(?=.*[a-z])").hasMatch(value)) {
                        missings +=
                            "Password must contain at least one lowercase letter\n";
                      }
                      if (!RegExp("(?=.*[A-Z])").hasMatch(value)) {
                        missings +=
                            "Password must contain at least one uppercase letter\n";
                      }
                      if (!RegExp((r'\d')).hasMatch(value)) {
                        missings +=
                            "Password must contain at least one digit\n";
                      }

                      //if there is password input errors return error string
                      if (missings != "") {
                        return missings;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    'Confirm Password',
                    controller: confirmPassword,
                    formKey: confirmPasswordKey,
                    validator: (text) {
                      if (password.text != text) {
                        return 'password dont match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomElevatedButton(
                    'Register',
                    onPressed: () {
                      if (emailkey.currentState!.validate() &&
                          passwordKey.currentState!.validate() &&
                          confirmPasswordKey.currentState!.validate()) {
                        context.read<RegisterCubit>().onRegister(
                            email: email.text, password: password.text);
                      }
                    },
                    bgColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                  ),
                  BlocListener<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is Loading) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            });
                      } else if (state is Error) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: const Color(0xFFFCD0CF),
                            margin: EdgeInsets.all(2.h),
                            behavior: SnackBarBehavior.floating,
                            content: CustomText(
                              state.message,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        );
                      } else if (state is Done) {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                        final student = StudentEntity(
                          uid: state.uid,
                          grade: grade.text,
                          section: section ?? 'no section',
                          lrn: lrn.text,
                          firstName: firstName.text,
                          email: email.text,
                          password: password.text,
                          lastName: lastName.text,
                        );
                        context
                            .read<UserCubit>()
                            .onCreateUser(student)
                            .then((value) {
                          AutoRouter.of(context).pop();
                        });
                      }
                    },
                    child: const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
