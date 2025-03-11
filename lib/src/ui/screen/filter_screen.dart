import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk/src/bloc/filter/filter_bloc.dart';
import 'package:kgk/src/data/model/data.dart';
import 'package:kgk/src/data/model/datas.dart';
import 'package:kgk/src/data/model/static/data_static.dart';
import 'package:kgk/src/ui/screen/cart_screen.dart';
import 'package:kgk/src/ui/widget/custom_gradient_button.dart';
import 'package:kgk/src/ui/widget/custom_horizontal_listview.dart';
import 'package:kgk/src/ui/widget/custom_single_horizontal_listview.dart';

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
                return CustomSingleHorizontalListView<String>(
                  title: "Select Shape",
                  items: shapeList, // Example list
                  selectedItem: state.selectedShape,
                  onSelected: (shape) {
                    context.read<FilterBloc>().add(SelectShape(shape));
                  },
                );
              },
            ),
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
