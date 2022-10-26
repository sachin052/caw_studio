import 'package:caw_studio/core/failures/failures.dart';
import 'package:caw_studio/core/usecase/use_case.dart';
import 'package:caw_studio/features/feed/domain/entity/feed_post_ui_entity.dart';
import 'package:caw_studio/features/feed/domain/repo/feed_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFeedUseCase extends UseCase<List<FeedPostUIEntity>, Unit> {
  final FeedRepo feedRepo;

  GetFeedUseCase(this.feedRepo);

  @override
  Future<Either<Failure, List<FeedPostUIEntity>>> call(Unit param) {
    return feedRepo.getFeedPosts();
  }
}
