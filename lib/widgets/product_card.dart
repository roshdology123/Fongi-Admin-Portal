import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/models/product.dart';
import 'package:fongi_admin_portal/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.products
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                Image.network(
                  products[index].image!,
                  height: 15.h,
                  width: 30.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(
                      title:  products[index].title,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Text(
                        products[index].description!,
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
          );
        },
      ),
    );
  }
}
