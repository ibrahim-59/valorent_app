import 'package:valorent_app/data/model/ability_model.dart';
import 'package:valorent_app/data/model/voice_line.dart';

class AgentModel {
  String fullPortrait, displayIcon, description, displayName;
  List<AbilityModel> abilities;
  VoiceLine voiceLine;

  AgentModel({
    required this.description,
    required this.displayIcon,
    required this.displayName,
    required this.fullPortrait,
    required this.abilities,
    required this.voiceLine,
  });
}
