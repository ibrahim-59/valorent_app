import 'package:dio/dio.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorent_app/constants/app_constants.dart';
import 'package:valorent_app/cubit/cubit/agents_cubit.dart';
import 'package:valorent_app/data/model/character_model/character_model.dart';
import 'package:valorent_app/data/repo/agents_repo_impl.dart';
import 'package:valorent_app/data/service/api_service.dart';
import 'package:valorent_app/view/screens/agents_with_same_role_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CharacterModel> characters = [];
  List<CharacterModel> controllers = [];
  List<CharacterModel> duolists = [];
  List<CharacterModel> initiators = [];
  List<CharacterModel> sentinals = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Expanded(
            child: DynamicHeightGridView(
                physics: const NeverScrollableScrollPhysics(),
                builder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => AgentsCubit(
                                          AgentsRepoImpl(
                                              apiService: ApiService(Dio())))
                                        ..fetchAgentsList(),
                                      child: AgentsWithSameRoleScreen(
                                        roleName: AppConstants
                                            .roles[index].displayName,
                                      ),
                                    )));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            AppConstants.roles[index].displayIcon,
                            height: 80,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            AppConstants.roles[index].displayName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 4,
                crossAxisCount: 2),
          ),
        ],
      ),
    ));
  }
}
