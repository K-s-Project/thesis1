import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/presentation/screen/auth/login_screen.dart';
import 'package:thesis1/presentation/screen/main/admin_screen.dart';
import 'package:thesis1/presentation/screen/main/main_screen.dart';
import 'package:thesis1/presentation/state/role/role_cubit.dart';
import 'package:thesis1/presentation/state/usercheck/user_check_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCheckCubit, UserCheckState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return BlocBuilder<RoleCubit, RoleState>(
            bloc: context.read<RoleCubit>()
              ..checkRole(uid: FirebaseAuth.instance.currentUser?.uid ?? ''),
            builder: (context, state) {
              if (state is Admin) {
                return const AdminScreen();
              } else if (state is Student) {
                return const MainScreen();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }
            },
          );
        } else if (state is UnAuthenticated) {
          return const LoginScreen();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
