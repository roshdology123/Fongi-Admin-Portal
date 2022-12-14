import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi_admin_portal/api_service/product_api_service.dart';
import 'package:fongi_admin_portal/models/product.dart';
import 'package:fongi_admin_portal/repository/products_repository.dart';
import 'package:fongi_admin_portal/widgets/custom_button.dart';
import 'package:fongi_admin_portal/widgets/custom_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../core/constants.dart';
import '../cubit/products_cubit.dart';

class NewProduct extends StatefulWidget {
  NewProduct({Key? key}) : super(key: key);

  static const String routeName = '/newProduct';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => NewProduct(),
    );
  }

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  var sizeController = TextEditingController();

  var descriptionController = TextEditingController();

  var colorController = TextEditingController();
  ProductsRepository productsRepository = ProductsRepository(APIService());
Product product = Product();
  List<String> categories = <String>['T-Shirt', 'Footwear', 'Watches'];
  String dropdownValue = 'T-Shirt';
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(255, 77, 255, 192),
                        ),
                        child: InkWell(
                          onTap: () async {
                            ImagePicker picker = ImagePicker();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.camera);
                            if (image == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('No Image Was Selected')));
                            }else{
                              String imageURL = await productsRepository.uploadImage(image);
                              product.image = imageURL;
                            }
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
                          product.title = value;
                          print(value);
                        },
                        controller: nameController,
                      ),
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Flexible(
                          child: CustomTextField(
                            label: 'Price',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            onChange: (value) {
                              product.price =int.parse(value);
                              print(value);
                            },
                            controller: priceController,
                          ),
                        ),
                        Flexible(
                          child: CustomTextField(
                            label: 'Size',
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please fill this field';
                              }
                              return null;
                            },
                            onChange: (value) {
                              product.size = value;
                              print(value);
                            },
                            controller: sizeController,
                          ),
                        )
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: CustomTextField(
                              label: 'Color',
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill this field';
                                }
                                return null;
                              },
                              onChange: (value) {
                                product.color= value;
                                print(value);
                              },
                              controller: colorController,
                            ),
                          ),
                          Flexible(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              isExpanded: true,
                              icon: const Icon(
                                Icons.arrow_downward,
                                color: kMainColor,
                              ),
                              elevation: 16,
                              style: const TextStyle(color: kMainColor),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                  product.category = value;
                                });
                              },
                              items: categories.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          )
                        ],
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
                          product.description = value;
                          print(value);
                        },
                        controller: descriptionController,
                      ),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Uploading Data')),
                            );
                            BlocProvider.of<ProductsCubit>(context).addProduct(product);
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
