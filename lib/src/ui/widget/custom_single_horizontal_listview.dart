import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/ui/widget/custom_title_text.dart';

class CustomSingleHorizontalListView<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final void Function(T) onSelected;
  final int crossAxisCount; // Number of items per row

  const CustomSingleHorizontalListView({
    Key? key,
    required this.title,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
    this.crossAxisCount = 5, // Default to 3 items per row
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleTextWidget(
          title: title,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true, // Ensures GridView doesn't take full screen
          physics:
              const NeverScrollableScrollPhysics(), // Prevents scrolling inside the GridView
          itemCount: items.length,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2,
            crossAxisSpacing: 12, // Adjust based on UI needs
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            final isSelected = item == selectedItem;
            return GestureDetector(
              onTap: () => onSelected(item),
              child: Container(
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: isSelected
                      ? AppColor.appBarColor
                      : AppColor.drawerBgColor,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFCFD4DC)),
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
                child: Text(item.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? AppColor.kWhiteColor
                            : AppColor.kGrayText,
                        fontSize: 14,
                        fontFamily: "SFProDisplay")),
              ),
            );
          },
        ),
      ],
    );
  }
}
