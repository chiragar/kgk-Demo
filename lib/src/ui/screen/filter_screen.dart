import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/data/model/stone_shape.dart';
import 'package:kgk/src/data/model/datas.dart';
import 'package:kgk/src/data/model/static/data_static.dart';
import 'package:kgk/src/ui/screen/cart_screen.dart';
import 'package:kgk/src/ui/widget/custom_gradient_button.dart';
import 'package:kgk/src/ui/widget/custom_horizontal_listview.dart';

import 'result_screen.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Items"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  return SizedBox(
                    height: 200,
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // Number of columns in the grid
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3, // Adjust based on your UI needs
                        ),
                        itemCount: stoneShapeData.length,
                        shrinkWrap: true,

                        itemBuilder: (context, index) {
                          final stoneShape = stoneShapeData[index];
                          final isSelected = state.selectedStoneShape?.id == stoneShape.id;

                          return GestureDetector(
                            onTap: () {
                              context.read<FilterBloc>().add(SelectStoneShape(stoneShape));
                            },
                            child: Container(
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
                              ],),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            stoneShape.stoneImage != null && stoneShape.stoneImage!.isNotEmpty
                                ? Image.network(stoneShape.stoneImage!, height: 50) // Display image if available
                                : Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                            SizedBox(height: 5),
                            Text(
                              stoneShape.stoneName ?? "No Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ],)
                            ),
                          );
                        }
                    ),
                  );}),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
