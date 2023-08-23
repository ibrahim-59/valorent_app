import 'package:flutter/material.dart';
import 'package:valorent_app/view/widgets/Icon_info_widget.dart';

import '../../data/model/character_model/ability.dart';
import '../../data/model/character_model/character_model.dart';

class AgentScreen extends StatelessWidget {
  final List<CharacterModel> data;
  final int index;
  const AgentScreen({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Ability> abilities = data[index].abilities!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 211, 101, 110),
            )),
        leadingWidth: 50,
        elevation: 0,
        backgroundColor: const Color(0xff53212b),
        title: Padding(
          padding: const EdgeInsets.only(right: 50, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconInfoWidget(data: data, index: index),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data[index].displayName ?? 'NoName',
                  style: const TextStyle(
                      color: Color(0xffff5BF5),
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: const Color(0xff53212B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(data[index].background!),
              )),
              child: Image.network(
                data[index].fullPortrait!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: abilities.length == 4 ? 4 : 5),
                  itemCount: abilities.length,
                  itemBuilder: (context, index) => ListTile(
                    title: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              title: Text(
                                abilities[index].displayName!,
                                style: const TextStyle(
                                    color: Color(0xfff04556),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20),
                              ),
                              content: Text(
                                abilities[index].description!,
                              ),
                              backgroundColor: const Color(0xff53212B),
                              contentTextStyle:
                                  const TextStyle(color: Colors.white),
                              elevation: 0,
                            );
                          },
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Image.network(
                          abilities[index].displayIcon ??
                              'https://media.valorant-api.com/agents/1e58de9c-4950-5125-93e9-a0aee9f98746/abilities/grenade/displayicon.png',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
