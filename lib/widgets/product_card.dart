import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.title,
    this.description,
    this.imgPath,
  }) : super(key: key);

  final String? title;
  final String? description;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Image.asset(
              //'assets/images/NikeAirForce.webp',
              imgPath!,
              height: 15.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(
                  title: title,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    description!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Row(
                    children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(FontAwesomeIcons.penToSquare)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(FontAwesomeIcons.trash)),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
