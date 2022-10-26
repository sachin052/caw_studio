part of 'feed_cubit.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoading extends FeedState {}

class FeedError extends FeedState {
  final String errorMessage;
  FeedError(this.errorMessage);
}

class FeedSuccess extends FeedState {
  final List<FeedPostUIEntity> items;
  FeedSuccess(this.items);
}
