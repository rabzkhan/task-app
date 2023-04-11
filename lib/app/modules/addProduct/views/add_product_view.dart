import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/theme/my_fonts.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  AddProductView({Key? key}) : super(key: key);

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  @override
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    Get.put(AddProductController());
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: GetBuilder<AddProductController>(
        builder: (addProductController) => Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: TextFormField(
                        controller: addProductController.pName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a product name";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          fillColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(
                                width: 1.w, color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: TextFormField(
                        controller: addProductController.pDescription,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter description";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Product Description",
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          fillColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(
                                width: 1.w, color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: TextFormField(
                        controller: addProductController.pPrice,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter price";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Product Price",
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          fillColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(
                                width: 1.w, color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: TextFormField(
                        controller: addProductController.pQuantity,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter quantity";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Product Quantity",
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              width: 1.w,
                              color: theme.primaryColor,
                            ),
                          ),
                          fillColor: Colors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.w),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                            borderSide: BorderSide(
                                width: 1.w, color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: theme.primaryColor.withOpacity(0.2),
                        ),
                        child: addProductController.imagePath.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    addProductController.imagePath = ''.obs;
                                  });
                                },
                                child: Image.file(
                                  File(addProductController.imagePath
                                      .toString()),
                                  fit: BoxFit.cover,
                                  height: 40.h,
                                  width: 40.w,
                                ),
                              )
                            : Center(
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pick Image",
                                    style: TextStyle(
                                      fontSize: MyFonts.headline4TextSize,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          addProductController
                                              .getImageFromCamera();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(100.w, 30.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(26.r),
                                          ),
                                        ),
                                        child: Text(
                                          "Camera",
                                          style: TextStyle(
                                            fontSize: MyFonts.headline5TextSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          addProductController
                                              .getImageFromGallary();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          minimumSize: Size(100.w, 30.h),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(26.r),
                                          ),
                                        ),
                                        child: Text(
                                          "Gallary",
                                          style: TextStyle(
                                            fontSize: MyFonts.headline5TextSize,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              addProductController.addPorduct();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(240.w, 52.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.r),
                          ),
                        ),
                        child: Text(
                          "Add Product",
                          style: TextStyle(
                            fontSize: MyFonts.headline5TextSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
