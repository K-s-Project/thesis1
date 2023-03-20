import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:thesis1/core/constants/defaults.dart';
import 'package:thesis1/core/constants/strings.dart';
import 'package:thesis1/core/router/custom_router.dart';
import 'package:thesis1/presentation/state/auths/login/login_cubit.dart';
import 'package:thesis1/presentation/state/basics/obscure/obscure_cubit.dart';
import 'package:thesis1/presentation/widget/custom_elevated_button.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';
import 'package:thesis1/presentation/widget/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final obscure = context.select((ObscureCubit obscure) => obscure.state);
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(DEFAULT_PADDING.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        RIZAL_LOGO,
                        height: 16.h,
                      ),
                      Image.asset(
                        SCHOOL_LOGO,
                        height: 16.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    'LOGIN',
                    size: 24.sp,
                    weight: FontWeight.w600,
                  ),
                  SizedBox(height: 2.h),
                  CustomTextfield(
                    'juan@example.com',
                    controller: email,
                    label: const CustomText('Email'),
                    keyboard: TextInputType.emailAddress,
                    formKey: emailKey,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 1.h),
                  CustomTextfield(
                    '* * * * * * * *',
                    controller: password,
                    label: const CustomText('Password'),
                    obscure: obscure,
                    formKey: passKey,
                    maxLines: 1,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'please enter your passwords';
                      }
                      return null;
                    },
                    suffix: IconButton(
                      icon: CustomText(obscure ? 'show' : 'hide'),
                      onPressed: () {
                        if (obscure) {
                          context.read<ObscureCubit>().show();
                        } else {
                          context.read<ObscureCubit>().hide();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CustomElevatedButton(
                    'Login',
                    bgColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                    onPressed: () {
                      if (emailKey.currentState!.validate() &&
                          passKey.currentState!.validate()) {
                        // context.read<AuthCubit>().onLogin(
                        //     email: email.text, password: password.text);
                        context.read<LoginCubit>().onLogin(
                            email: email.text, password: password.text);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText('new to this app?'),
                      TextButton(
                        onPressed: () {
                          AutoRouter.of(context).push(const RegisterRoute());
                        },
                        child: const CustomText('Register'),
                      ),
                    ],
                  ),
                  BlocListener<LoginCubit, LoginState>(
                    listener: (context, state) {
                      print('auth state $state');
                      if (state is LoggingIn) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            });
                      } else if (state is Done) {
                        if (Navigator.canPop(context)) Navigator.pop(context);
                      } else if (state is LoggedIn) {
                        if (Navigator.canPop(context)) Navigator.pop(context);
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
