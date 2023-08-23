import 'package:dartz/dartz.dart';
import 'package:valorent_app/constants/failure.dart';
import 'package:valorent_app/data/model/character_model/character_model.dart';

abstract class AgentsRepo {
  Future<Either<Failure, List<CharacterModel>>> getAgentsData();
}
