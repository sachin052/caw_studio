import 'package:caw_studio/core/failures/failures.dart';
import 'package:caw_studio/features/feed/domain/entity/feed_post_ui_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FeedRepo{
  Future<Either<Failure,List<FeedPostUIEntity>>> getFeedPosts();
}