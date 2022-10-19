import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/color.dart';
import '../../../generated/assets.dart';
import 'feed_tags_chips.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COMMUNITY",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: lightGrey, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "All Community",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: colorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: colorPrimary,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 18.0,
              backgroundImage: NetworkImage(
                  "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250"),
              backgroundColor: Colors.transparent,
            )
          ],
        ),
        SizedBox(
          height: 22,
        ),
        Row(
          children: [
            Flexible(
              child: Container(
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                      hintStyle: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(color: lightGrey, fontSize: 14),
                      contentPadding: EdgeInsets.only(left: 8),
                      hintText: "Search post and members",
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorPrimary.withOpacity(.2))),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorPrimary.withOpacity(.2)))),
                ),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            SvgPicture.asset(
              Assets.imagesNotification,
              height: 17,
              width: 17,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        FeedTagsChips()
      ],
    );
  }
}
