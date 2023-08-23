import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valorent_app/data/model/character_model/character_model.dart';
import 'package:valorent_app/data/repo/agents_repo.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit(this.agentsRepo) : super(AgentsInitial());
  final AgentsRepo agentsRepo;

  Future<void> fetchAgentsList() async {
    emit(AgentsLoading());
    var result = await agentsRepo.getAgentsData();
    result.fold((failure) {
      emit(AgentsFailure(errorMessage: failure.message));
    }, (agent) {
      emit(AgentsSuccess(agents: agent));
    });
  }
}
