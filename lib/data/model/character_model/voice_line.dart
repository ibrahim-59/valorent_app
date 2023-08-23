import 'package:equatable/equatable.dart';

import 'media_list.dart';

class VoiceLine extends Equatable {
	final double? minDuration;
	final double? maxDuration;
	final List<MediaList>? mediaList;

	const VoiceLine({this.minDuration, this.maxDuration, this.mediaList});

	factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
				minDuration: (json['minDuration'] as num?)?.toDouble(),
				maxDuration: (json['maxDuration'] as num?)?.toDouble(),
				mediaList: (json['mediaList'] as List<dynamic>?)
						?.map((e) => MediaList.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'minDuration': minDuration,
				'maxDuration': maxDuration,
				'mediaList': mediaList?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [minDuration, maxDuration, mediaList];
}
