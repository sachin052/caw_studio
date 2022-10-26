import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/feed_post_ui_entity.dart';
import '../../domain/use_cases/get_feed_use_case.dart';

part 'feed_state.dart';

@injectable
class FeedCubit extends Cubit<FeedState> {
  final GetFeedUseCase getFeedUseCase;
  FeedCubit(this.getFeedUseCase) : super(FeedInitial());

  fetchData()async{
    emit(FeedLoading());
    await Future.delayed(const Duration(seconds: 2));
    var either = await getFeedUseCase(unit);
    either.fold((l) => emit(FeedError("Something went wrong")), (r) => emit(FeedSuccess(r)));
  }
}
