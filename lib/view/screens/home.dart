import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorent_app/cubit/cubit/agents_cubit.dart';
import 'package:valorent_app/data/repo/agents_repo_impl.dart';
import 'package:valorent_app/data/service/api_service.dart';
import 'package:valorent_app/view/screens/agents_screen.dart';

import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentPage = 0;
  late PageController controller;
  List<Widget> screens = [
    const HomeScreen(),
    BlocProvider(
      create: (context) => AgentsCubit(
        AgentsRepoImpl(
          apiService: ApiService(
            Dio(),
          ),
        ),
      )..fetchAgentsList(),
      child: const AgentsScreen(),
    ),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        indicatorColor: Colors.transparent,
        selectedIndex: currentPage,
        backgroundColor: const Color(0xff53212C),
        elevation: 0,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (value) {
          setState(() {
            currentPage = value;
          });
          controller.jumpToPage(currentPage);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.category,
              color: Colors.red,
            ),
            icon: Icon(
              Icons.category,
              color: Colors.white,
            ),
            label: 'Roles',
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: Colors.red,
            ),
            icon: Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
            label: 'Agents',
          ),
        ],
      ),
    );
  }
}
