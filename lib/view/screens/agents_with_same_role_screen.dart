import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorent_app/cubit/cubit/agents_cubit.dart';
import 'package:valorent_app/view/screens/agent_screen.dart';
import 'package:valorent_app/view/widgets/agents_card.dart';
import '../../data/model/character_model/character_model.dart';

class AgentsWithSameRoleScreen extends StatelessWidget {
  final String roleName;
  const AgentsWithSameRoleScreen({super.key, required this.roleName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgentsCubit, AgentsState>(
        builder: (context, state) {
          if (state is AgentsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AgentsSuccess) {
            List<CharacterModel> sential = state.agents
                .where((element) => element.role?.displayName! == roleName)
                .toList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: DynamicHeightGridView(
                        builder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AgentScreen(
                                          data: sential, index: index)),
                                );
                              },
                              child: AgentsCard(
                                data: sential[index],
                              ),
                            ),
                          );
                        },
                        itemCount: sential.length,
                        crossAxisCount: 2),
                  ),
                ],
              ),
            );
          } else if (state is AgentsFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Text('something went wrong');
        },
      ),
    );
  }
}
