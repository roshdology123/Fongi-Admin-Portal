import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/widgets/section_title.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/constants.dart';
import '../widgets/dashboard_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final List<Widget> widgetList = [
    DashboardCarousel(icon: FontAwesomeIcons.bagShopping, title: 'Products',details: '213',),
    DashboardCarousel(icon: FontAwesomeIcons.boxesPacking, title: 'Stock',details:'1251'),
    DashboardCarousel(icon: FontAwesomeIcons.bicycle, title: 'Orders',details:'125123'),
  ];

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Admin Portal',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
            backgroundColor: kMainColor,
          ),
          body: Container(
            color: kBackgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 30.h,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason){
                        setState(() {
                          _current = index;
                        });
                      }
                    ),
                    items: widgetList,

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widgetList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (kMainColor)
                                .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }
                  ).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

