abstract class GetTopHeadlineState{}
class GetTopHeadlineInitialState extends GetTopHeadlineState{}
class GetTopHeadlineFailureState extends GetTopHeadlineState{
  final String errorMessage;

  GetTopHeadlineFailureState({
    required this.errorMessage
});
}
class GetTopHeadlineSuccessState extends GetTopHeadlineState{}
class GetTopHeadlineLoadingState extends GetTopHeadlineState{}