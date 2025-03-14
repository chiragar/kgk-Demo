import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/core/constant/app_navigation.dart';
import 'package:kgk/src/core/constant/app_textstyle.dart';
import 'package:kgk/src/data/model/datas.dart';
import 'package:kgk/src/data/model/static/data_static.dart';
import 'package:kgk/src/data/model/stone_shape.dart';
import 'package:kgk/src/ui/screen/cart_screen.dart';
import 'package:kgk/src/ui/screen/result_screen.dart';
import 'package:kgk/src/ui/widget/custom_gradient_button.dart';
import 'package:kgk/src/ui/widget/custom_horizontal_listview.dart';


class FilterScreen extends StatelessWidget {
  final TextEditingController minSizeController = TextEditingController();
  final TextEditingController maxSizeController = TextEditingController();

   FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Items"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () =>
              AppNavigation.pushTo(const CartScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (stoneShapeData.length / 2).ceil(), // Ensuring all items are included
                        itemBuilder: (context, index) {
                          int firstIndex = index * 2;
                          int secondIndex = firstIndex + 1;

                          final firstStoneShape = stoneShapeData[firstIndex];
                          final isSelectedFirst = state.selectedStoneShape?.id == firstStoneShape.id;

                          final bool hasSecond = secondIndex < stoneShapeData.length;
                          final secondStoneShape = hasSecond ? stoneShapeData[secondIndex] : null;
                          final isSelectedSecond = secondStoneShape != null &&
                              state.selectedStoneShape?.id == secondStoneShape.id;

                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildStoneItem(context, firstStoneShape, isSelectedFirst),
                                SizedBox(height: 4),
                                if (hasSecond) buildStoneItem(context, secondStoneShape!, isSelectedSecond),
                              ],
                            ),
                          );
                        },
                      )
                    );}),
        
              _buildSizeInputRow(context),
              const SizedBox(height: 20),
              _buildSizeRangeList(context),
        
              CustomHorizontalListView(
                title: "Select Clarity",
                listtype: clarityList,
                selectedItems: context.watch<FilterBloc>().state.selectedClarity,
                onItemTapped: (clarity) =>
                    context.read<FilterBloc>().add(SelectedClarity(clarity)),
              ),
              CustomHorizontalListView(
                title: "Select Colors",
                listtype: colorList,
                selectedItems: context.watch<FilterBloc>().state.selectedColors,
                onItemTapped: (color) =>
                    context.read<FilterBloc>().add(ToggleColor(color)),
              ),
              CustomHorizontalListView(
                title: "Select Lab",
                listtype: labList,
                selectedItems: context.watch<FilterBloc>().state.selectedLab,
                onItemTapped: (lab) =>
                    context.read<FilterBloc>().add(SelectedLab(lab)),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.04,
              ),
              CustomGradientButtonWidget(
                buttonName: "Show Results",
                onTaps: () {
                  context.read<FilterBloc>().add(ApplyFilter(datas));

                  AppNavigation.pushTo(ResultScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildSizeInputRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextField(context: context,controller: minSizeController,label:  "Min Size"),
        _buildTextField(context: context,controller: maxSizeController,label: "Max Size"),
        InkWell(
          onTap: () {
            if (minSizeController.text.isNotEmpty &&
                maxSizeController.text.isNotEmpty) {
              context.read<FilterBloc>().add(AddSizeRange(
                minSize: minSizeController.text.trim(),
                maxSize: maxSizeController.text.trim(),
              ));
              minSizeController.clear();
              maxSizeController.clear();
            }
          },
          child: Container(
            alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width*0.2,
              height:MediaQuery.sizeOf(context).height*0.06,
              decoration: const BoxDecoration(
                gradient: AppColor.buttonGradient
              ),
              child:  Text("+", textAlign: TextAlign.center,style: AppTextStyle.ts20(color: AppColor.kWhiteColor))),
        ),
      ],
    );
  }

  Widget _buildSizeRangeList(context) {
    var size=MediaQuery.sizeOf(context);
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        return state.sizeRanges.length !=0?
        SizedBox(
          width: double.infinity,
          height: size.height*0.05,
          child: ListView.builder(
            shrinkWrap: true,

            scrollDirection: Axis.horizontal,
            itemCount: state.sizeRanges.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04),
                decoration: ShapeDecoration(
                  color: AppColor.drawerBgColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1, color: Color(0xFFCFD4DC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0C101828),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(state.sizeRanges[index]),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => context
                          .read<FilterBloc>()
                          .add(RemoveSizeRange(index)),
                    ),
                  ],
                ),
              );
            },
          ),
        ):const SizedBox.shrink();
      },
    );
  }

  Widget _buildTextField({required BuildContext context,required TextEditingController controller, required String label}) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width*0.35,
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(hintText: label),
      ),
    );
  }

  Widget buildStoneItem(BuildContext context, StoneShape stoneShape, bool isSelected) {
    var size=MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        context.read<FilterBloc>().add(SelectStoneShape(stoneShape)); // Ensure BlocProvider is above
      },
      child: Container(
        width:size.width*0.2, // Adjust width based on your UI
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.grey,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            stoneShape.stoneImage != null && stoneShape.stoneImage!.isNotEmpty
                ? Image.asset(stoneShape.stoneImage!,height: size.width*0.15,   fit: BoxFit.contain)
                : Icon(Icons.image_not_supported, size: size.width*0.15, color: Colors.grey),
            SizedBox(height: 5),
            Text(
              stoneShape.stoneName ?? "No Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
