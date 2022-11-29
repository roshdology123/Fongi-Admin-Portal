import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/widgets/custom_button.dart';
import 'package:fongi_admin_portal/widgets/custom_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/constants.dart';

class NewProduct extends StatelessWidget {
  NewProduct({Key? key}) : super(key: key);

  static const String routeName = '/newProduct';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => NewProduct(),
    );
  }

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var sizeController = TextEditingController();
  var descriptionController = TextEditingController();
  var colorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'New Product',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
            backgroundColor: kMainColor,
          ),
          body: Container(
            height: 100.h,
            color: kBackgroundColor,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [

                      Container(
                        width: 90.w,
                        height: 20.h,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Color.fromARGB(255, 77, 255, 192),),
                        child: InkWell(
                          onTap: () {

                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add an image',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              const Icon(FontAwesomeIcons.plus),
                            ],
                          ),
                        ),
                      ),

                      CustomTextField(
                        label: 'Product Name',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        onChange: (value) {
                          print(value);
                        },
                        controller: nameController,
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: CustomTextField(
                            label: 'Price',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            onChange: (value) {
                              print(value);
                            },
                            controller: priceController,
                          ),),
                          Flexible(
                            child:  CustomTextField(
                            label: 'Size',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            onChange: (value) {
                              print(value);
                            },
                            controller: sizeController,
                          ),)

                        ]

                      ),
                      CustomTextField(
                        label: 'Color',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        onChange: (value) {
                          print(value);
                        },
                        controller: colorController,
                      ),
                      CustomTextField(
                        label: 'Description',
                        maxLines: 4,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please fill this field';
                          }
                          return null;
                        },
                        onChange: (value) {
                          print(value);
                        },
                        controller: descriptionController,
                      ),

                      CustomButton(onTap: (){
                        if(formKey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(content: Text('Uploading Data')),
                          );
                        }
                      },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
