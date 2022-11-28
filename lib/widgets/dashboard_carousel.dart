import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class DashboardCarousel extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final String? details;
  const DashboardCarousel({
    Key? key, this.title, this.icon, this.details,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 30.h,
        child: InkWell(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SectionTitle(title: title),
              ),
              Icon(icon),
              SizedBox(height: 8.h,),
              Text(
                  details!,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/products');
          },
        ),
      ),
    );
  }
}
