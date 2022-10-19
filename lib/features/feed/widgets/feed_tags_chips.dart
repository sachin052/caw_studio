import 'package:flutter/material.dart';

import '../../../core/theme/color.dart';

class FeedTagsChips extends StatelessWidget {
  final allTitles = ["All Posts", "News", "Diet", "Lifestyle"];

  FeedTagsChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: allTitles
          .map((e) => Padding(
                padding: EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 26,
                  child: ChoiceChip(
                    padding: EdgeInsets.only(bottom: 8, right: 8, left: 8),
                    // labelPadding: EdgeInsets.zero,
                    labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: colorPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    label: Text(e),
                    selected: e == "News",
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: colorPrimary.withOpacity(.2)),
                        borderRadius: BorderRadius.circular(100)),
                    backgroundColor: Colors.white,
                    disabledColor: Colors.white,
                    selectedColor: lightColorPrimary.withOpacity(.5),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
