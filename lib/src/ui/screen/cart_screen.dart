import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/cart/cart_bloc.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/ui/widget/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cartItems.isEmpty) {
            return const Center(child: Text("No items in cart"));
          }
          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final item = state.cartItems[index];

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
                              InkWell(
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(RemoveFromCart(item));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.2,
                                  height: size.height * 0.04,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(3),
                                        topLeft: Radius.circular(8)),
                                    color: AppColor.appBarColor,
                                  ),
                                  child: const Icon(
                                    Icons.remove_shopping_cart_sharp,
                                    color: AppColor.kWhiteColor,
                                  ),
                                ),
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
