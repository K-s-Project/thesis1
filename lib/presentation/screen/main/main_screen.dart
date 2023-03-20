import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thesis1/core/constants/strings.dart';
import 'package:thesis1/presentation/screen/main/lesson_screen.dart';
import 'package:thesis1/presentation/screen/main/note_screen.dart';
import 'package:thesis1/presentation/screen/main/profile_screen.dart';
import 'package:thesis1/presentation/state/basics/bnb/bnb_cubit.dart';
import 'package:thesis1/presentation/widget/custom_text.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final currentIndex = context.select((BnbCubit bnb) => bnb.state);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: Image.asset(RIZAL_LOGO),
            title: const CustomText(
              'E-Learning',
              color: Colors.white,
            ),
            centerTitle: true,
            actions: [
              Image.asset(SCHOOL_LOGO),
            ],
          ),
          body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeScreen(),
              ProfileScreen(),
              LessonScreen(),
              NotesScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndex,
            onTap: (index) {
              pageController.jumpToPage(index);
              context.read<BnbCubit>().navigate(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_max_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_books_rounded),
                label: 'Lessons',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notes_rounded),
                label: 'Notes',
              ),
            ],
          ),
        );
      },
    );
  }
}
