import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SectionTitle extends StatelessWidget {
  final String? title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 2.w),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
