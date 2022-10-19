import 'package:caw_studio/core/theme/color.dart';
import 'package:caw_studio/features/authentication/domain/entiity/feed_post_ui_entity.dart';
import 'package:caw_studio/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedPostWidget extends StatefulWidget {
  final FeedPostUIEntity feedPostUIEntity;

  const FeedPostWidget({Key? key, required this.feedPostUIEntity})
      : super(key: key);

  @override
  State<FeedPostWidget> createState() => _FeedPostWidgetState();
}

class _FeedPostWidgetState extends State<FeedPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.feedPostUIEntity.feedTag,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: lightGrey, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                widget.feedPostUIEntity.timePostedAgo,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: darkGrey),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildPostHead(context),
          const SizedBox(height: 15,),
          Text(
            widget.feedPostUIEntity.postTitle,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: darkGrey, fontWeight: FontWeight.w700,fontSize: 16),
          ),
          const SizedBox(height: 5,),
          Text(
            widget.feedPostUIEntity.postBody,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: darkGrey, fontWeight: FontWeight.w400,fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.network(widget.feedPostUIEntity.postURL,height: 200,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
          const SizedBox(height: 10,),
          Row(children: [
            const Icon(Icons.location_on_outlined,color: colorPrimary,),
            const SizedBox(width: 4,),
            Text(
              widget.feedPostUIEntity.location,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: colorPrimary, fontWeight: FontWeight.w400,fontSize: 12),
            )
          ],),
          const SizedBox(height: 10,),
          const Divider(thickness: 1,),
          _buildReactionStack(context),
          const Divider(thickness: 1,),
          Row(
            children: [
              Expanded(
                child: IconButton(onPressed: (){}, icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesLike),
                    const SizedBox(width: 4,),
                    Text(widget.feedPostUIEntity.likeCount.toString())
                  ],
                )),
              ),
              Expanded(
                child: IconButton(onPressed: (){}, icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.imagesComment),
                    const SizedBox(width: 4,),
                    Text(widget.feedPostUIEntity.commentCount.toString())
                  ],
                )),
              ),
              Expanded(
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_outline,color: darkGrey,size: 20,)),
              ),
              Expanded(
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.share_outlined,color: darkGrey,size: 20,)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row _buildReactionStack(BuildContext context) {
    return Row(children: [
          Stack(
            children: const [
              SizedBox(width: 50,),
              CircleAvatar(
                radius: 12.0,
                backgroundImage: NetworkImage(
                    "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                backgroundColor: Colors.transparent,
              ),
              Positioned(
                  left: 10,
                  // right: 0,
                  top: 0,
                  child: CircleAvatar(
                radius: 12.0,
                backgroundImage: NetworkImage(
                    "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"),
                backgroundColor: Colors.transparent,
              )),
              Positioned(
                  left: 20,
                  // right: 0,
                  top: 0,
                  child: CircleAvatar(
                    radius: 12.0,
                    backgroundImage: NetworkImage(
                        "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
                    backgroundColor: Colors.transparent,
                  ))
            ],
          ),
          Text(
            "${widget.feedPostUIEntity.likeCount} members likes this event",
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: darkGrey, fontWeight: FontWeight.w400),
          )
        ],);
  }

  Row _buildPostHead(BuildContext context) {
    return Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.feedPostUIEntity.userName,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: darkGrey, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      widget.feedPostUIEntity.postActionCreated,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: lightGrey, fontWeight: FontWeight.w500,fontSize: 13),
                    )

                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  widget.feedPostUIEntity.currentStatus,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: colorPrimary, fontSize: 12),
                )
              ],
            ),
            Spacer(),
            Icon(Icons.more_vert)
          ],
        );
  }
}
