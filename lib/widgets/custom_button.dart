import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/core/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(255, 77, 255, 192),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Product',
              style: Theme.of(context).textTheme.headline3,
            ),
            const Icon(FontAwesomeIcons.plus),
          ],
        ),
      ),
    );
  }
}
