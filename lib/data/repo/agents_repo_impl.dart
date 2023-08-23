import 'package:dartz/dartz.dart';
import 'package:valorent_app/constants/failure.dart';
import 'package:valorent_app/data/model/character_model/character_model.dart';
import 'package:valorent_app/data/repo/agents_repo.dart';
import 'package:valorent_app/data/service/api_service.dart';

class AgentsRepoImpl implements AgentsRepo {
  final ApiService apiService;

  AgentsRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<CharacterModel>>> getAgentsData() async {
    try {
      final data = await apiService.get();
      List<CharacterModel> agents = [];
      for (var item in data['data']) {
        agents.add(CharacterModel.fromJson(item));
      }

      return right(agents);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
