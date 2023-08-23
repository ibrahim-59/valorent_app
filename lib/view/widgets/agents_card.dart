import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AgentsCard extends StatelessWidget {
  final dynamic data;
  const AgentsCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            data.background ??
                'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              FancyShimmerImage(
                boxFit: BoxFit.contain,
                imageUrl: data.fullPortrait ??
                    'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FancyShimmerImage(
                  imageUrl: data.role?.displayIcon ??
                      "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png",
                  width: 0.08 * MediaQuery.of(context).size.width,
                  height: 0.08 * MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
          Text(
            data.displayName ?? 'No Name',
            style: const TextStyle(
                color: Color(0xffff5BF5),
                fontWeight: FontWeight.w600,
                fontSize: 25),
          ),
        ],
      ),
    );
  }
}
