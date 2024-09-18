abstract class SearchStates{}
class SearchInitialState extends SearchStates{}
class SearchFailureState extends SearchStates{
  final String errorMessage;

  SearchFailureState({
    required this.errorMessage
  });
}
class SearchSuccessState extends SearchStates{}
class SearchLoadingState extends SearchStates{}