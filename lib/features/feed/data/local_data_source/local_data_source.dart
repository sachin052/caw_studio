import 'package:caw_studio/features/feed/domain/entity/feed_post_ui_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataSource{
  List<FeedPostUIEntity> getFeeds(){
    return [FeedPostUIEntity.generateDummyMOdel(),FeedPostUIEntity.generateDummyMOdel()];
  }
}