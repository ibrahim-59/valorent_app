part of 'agents_cubit.dart';

@immutable
sealed class AgentsState {}

final class AgentsInitial extends AgentsState {}

final class AgentsLoading extends AgentsState {}

final class AgentsSuccess extends AgentsState {
  final List<CharacterModel> agents;

  AgentsSuccess({required this.agents});
}

final class AgentsFailure extends AgentsState {
  final String errorMessage;

  AgentsFailure({required this.errorMessage});
}
