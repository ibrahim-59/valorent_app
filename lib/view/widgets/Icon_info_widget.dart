import 'package:flutter/material.dart';

import '../../data/model/character_model/character_model.dart';

class IconInfoWidget extends StatelessWidget {
  final List<CharacterModel> data;
  final int index;
  const IconInfoWidget({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  title: Text(
                    data[index].role?.displayName ?? '',
                    style: const TextStyle(
                        color: Color(0xfffD4556),
                        fontWeight: FontWeight.w800,
                        fontSize: 20),
                  ),
                  content: Text(
                    data[index].role?.description ?? '',
                  ),
                  backgroundColor: const Color(0xff53212B),
                  contentTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  elevation: 0,
                );
              },
            );
          },
          child: Image.network(
            data[index].role?.displayIcon ?? '',
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
      ),
    );
  }
}
