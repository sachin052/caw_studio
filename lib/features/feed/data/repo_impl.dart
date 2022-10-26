import 'package:caw_studio/core/failures/failures.dart';
import 'package:caw_studio/features/feed/data/local_data_source/local_data_source.dart';
import 'package:caw_studio/features/feed/domain/entity/feed_post_ui_entity.dart';
import 'package:caw_studio/features/feed/domain/repo/feed_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FeedRepo)
class FeedRepoImpl extends FeedRepo {
  final LocalDataSource localDataSource;

  FeedRepoImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<FeedPostUIEntity>>> getFeedPosts() {
    return Future.value(right(localDataSource.getFeeds()));
  }
}
