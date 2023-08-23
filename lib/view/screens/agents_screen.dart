import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorent_app/cubit/cubit/agents_cubit.dart';
import 'agent_screen.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsCubit, AgentsState>(
      builder: (context, state) {
        if (state is AgentsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AgentsSuccess) {
          return SafeArea(
              child: Scaffold(
            body: Column(
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
                                        data: state.agents, index: index)),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    state.agents[index].background ??
                                        'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        state.agents[index].fullPortrait ??
                                            'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Image.network(
                                          state.agents[index].role
                                                  ?.displayIcon ??
                                              "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png",
                                          width: 0.08 *
                                              MediaQuery.of(context).size.width,
                                          height: 0.08 *
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    state.agents[index].displayName ??
                                        'No Name',
                                    style: const TextStyle(
                                        color: Color(0xffff5BF5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: state.agents.length,
                      crossAxisCount: 2),
                ),
              ],
            ),
          ));
        } else if (state is AgentsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const Text('something went wrong');
      },
    );
  }
}
