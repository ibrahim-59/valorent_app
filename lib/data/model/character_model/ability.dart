import 'package:equatable/equatable.dart';

class Ability extends Equatable {
	final String? slot;
	final String? displayName;
	final String? description;
	final String? displayIcon;

	const Ability({
		this.slot, 
		this.displayName, 
		this.description, 
		this.displayIcon, 
	});

	factory Ability.fromJson(Map<String, dynamic> json) => Ability(
				slot: json['slot'] as String?,
				displayName: json['displayName'] as String?,
				description: json['description'] as String?,
				displayIcon: json['displayIcon'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'slot': slot,
				'displayName': displayName,
				'description': description,
				'displayIcon': displayIcon,
			};

	@override
	List<Object?> get props {
		return [
				slot,
				displayName,
				description,
				displayIcon,
		];
	}
}
