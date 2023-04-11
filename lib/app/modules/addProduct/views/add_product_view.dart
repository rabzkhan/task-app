import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../config/theme/my_fonts.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_snackbar.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends StatefulWidget {
  AddProductView({Key? key}) : super(key: key);

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final formKey = GlobalKey<FormState>();

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
                      padding: EdgeInsets.only(top: 10.h),
                      child: ElevatedButton(
                        onPressed: () async {
                          // setState(() {
                          //   if (formKey.currentState!.validate()) {
                          //     addProductController.addPorduct();
                          //   }
                          // });
                          addProductController.addPorduct();
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
