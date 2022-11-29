import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/widgets/section_title.dart';
import 'package:sizer/sizer.dart';

class ProductPreview extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imgPath;
  const ProductPreview({
    Key? key, this.title, this.description, this.imgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            //'assets/images/NikeAirForce.webp',
            imgPath!,
            height: 20.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              SectionTitle(
                title: title,
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Text(
                  description!,
                  style: Theme.of(context).textTheme.headline6,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
