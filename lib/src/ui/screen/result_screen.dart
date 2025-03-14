import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/cart/cart_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/ui/screen/cart_screen.dart';
import 'package:kgk/src/ui/widget/custom_text.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Results"),
        actions: [
          DropdownButton<SortOption>(
            underline: const SizedBox(),
            value: context.watch<FilterBloc>().state.sortOption, // Use watch instead of read
            icon: const Icon(Icons.sort, color: AppColor.kWhiteColor),
            dropdownColor: AppColor.appBarColor,
            style: const TextStyle(color: AppColor.kWhiteColor),
            onChanged: (SortOption? newValue) {
              if (newValue != null) {
                context.read<FilterBloc>().add(ApplySorting(newValue));
              }
            },
            items: const [
              DropdownMenuItem(value: SortOption.priceAsc, child: Text("Final Price Asc")),
              DropdownMenuItem(value: SortOption.priceDesc, child: Text("Final Price Desc")),
              DropdownMenuItem(value: SortOption.caratAsc, child: Text("Carat Weight Asc")),
              DropdownMenuItem(value: SortOption.caratDesc, child: Text("Carat Weight Desc")),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.filteredItems.length,
            itemBuilder: (context, index) {
              final item = state.filteredItems[index];
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFEE3C41)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 20,
                              height: 20,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF35C01D),
                                shape: OvalBorder(),
                              ),
                              alignment: Alignment.center,
                              child: CustomTextWidget(
                                  fw: FontWeight.w700,
                                  txtColor: Colors.white,
                                  titleTxt: item.qty.toString())),
                          const CustomTextWidget(
                              txtColor: AppColor.drawerTextColor,
                              titleTxt: "CTS:",
                              fw: FontWeight.w700),
                          CustomTextWidget(
                              txtColor: AppColor.appBarColor,
                              titleTxt: "DIS ${item.discount.toString()}",
                              fw: FontWeight.w700),
                          CustomTextWidget(
                              txtColor: AppColor.kColor,
                              titleTxt: "AMT: ${item.finalAmount ?? ""}",
                              fw: FontWeight.w700),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColor.appBarColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4, left: 4),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: ShapeDecoration(
                              color: AppColor.drawerBgColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextWidget(titleTxt: item.lotID ?? ""),
                                const SizedBox(height: 12),
                                CustomTextWidget(titleTxt: item.shape ?? "")
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CustomTextWidget(titleTxt: item.size ?? ""),
                                  CustomTextWidget(titleTxt: item.color ?? ""),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomTextWidget(
                                  titleTxt: "Polish: ${item.polish ?? ""}"),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomTextWidget(
                                  titleTxt: "FLOU: ${item.fluorescence ?? ""}")
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                  titleTxt:
                                      "Per:${item.perCaratRate.toString()}"),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomTextWidget(
                                  titleTxt: "CERT: ${item.carat ?? ""}"),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomTextWidget(
                                  titleTxt: "SYM: ${item.symmetry ?? ""}")
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextWidget(
                                  titleTxt: "Lab: ${item.lab ?? ""} "),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomTextWidget(
                                  titleTxt: "Size: ${item.size ?? ""} "),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  final isInCart = state.cartItems.contains(item); // Check if item is in cart

                                  return InkWell(
                                    onTap: () {
                                      if (isInCart) {
                                        context.read<CartBloc>().add(RemoveFromCart(item));
                                      } else {
                                        context.read<CartBloc>().add(AddToCart(item));
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: size.width * 0.2,
                                      height: size.height * 0.04,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(3),
                                          topLeft: Radius.circular(8),
                                        ),
                                        color: isInCart ? Colors.red : AppColor.kLightTealColor, // Change color for remove button
                                      ),
                                      child: Icon(
                                        isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart_sharp, // Change icon
                                        color: AppColor.kWhiteColor,
                                      ),
                                    ),
                                  );
                                },
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  SizedBox commonText({required String text}) => SizedBox(
        width: 80,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
}
