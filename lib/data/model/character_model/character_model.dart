import 'package:equatable/equatable.dart';

import 'ability.dart';
import 'role.dart';
import 'voice_line.dart';

class CharacterModel extends Equatable {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final dynamic characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<dynamic>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final List<Ability>? abilities;
  final VoiceLine? voiceLine;

  const CharacterModel({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
    this.voiceLine,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      uuid: json['uuid'] as String?,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      developerName: json['developerName'] as String?,
      characterTags: json['characterTags'] as dynamic,
      displayIcon: json['displayIcon'] as String?,
      displayIconSmall: json['displayIconSmall'] as String?,
      bustPortrait: json['bustPortrait'] as String?,
      fullPortrait: json['fullPortrait'] as String?,
      fullPortraitV2: json['fullPortraitV2'] as String?,
      killfeedPortrait: json['killfeedPortrait'] as String?,
      background: json['background'] as String?,
      backgroundGradientColors:
          json['backgroundGradientColors'] as List<dynamic>?,
      assetPath: json['assetPath'] as String?,
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'] as bool?,
      isPlayableCharacter: json['isPlayableCharacter'] as bool?,
      isAvailableForTest: json['isAvailableForTest'] as bool?,
      isBaseContent: json['isBaseContent'] as bool?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      voiceLine: json['voiceLine'] == null
          ? null
          : VoiceLine.fromJson(json['voiceLine'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'description': description,
        'developerName': developerName,
        'characterTags': characterTags,
        'displayIcon': displayIcon,
        'displayIconSmall': displayIconSmall,
        'bustPortrait': bustPortrait,
        'fullPortrait': fullPortrait,
        'fullPortraitV2': fullPortraitV2,
        'killfeedPortrait': killfeedPortrait,
        'background': background,
        'backgroundGradientColors': backgroundGradientColors,
        'assetPath': assetPath,
        'isFullPortraitRightFacing': isFullPortraitRightFacing,
        'isPlayableCharacter': isPlayableCharacter,
        'isAvailableForTest': isAvailableForTest,
        'isBaseContent': isBaseContent,
        'role': role?.toJson(),
        'abilities': abilities?.map((e) => e.toJson()).toList(),
        'voiceLine': voiceLine?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      uuid,
      displayName,
      description,
      developerName,
      characterTags,
      displayIcon,
      displayIconSmall,
      bustPortrait,
      fullPortrait,
      fullPortraitV2,
      killfeedPortrait,
      background,
      backgroundGradientColors,
      assetPath,
      isFullPortraitRightFacing,
      isPlayableCharacter,
      isAvailableForTest,
      isBaseContent,
      role,
      abilities,
      voiceLine,
    ];
  }
}
