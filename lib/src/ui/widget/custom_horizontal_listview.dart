import 'package:flutter/material.dart';
import 'package:kgk/src/core/constant/app_color.dart';
import 'package:kgk/src/ui/widget/custom_title_text.dart';

class CustomHorizontalListView extends StatelessWidget {
  final String title;
  final double? paddings;
  final List<String> listtype;
  final List<String> selectedItems;
  final void Function(String) onItemTapped;

  const CustomHorizontalListView({
    super.key,
    required this.listtype,
    required this.title,
    this.paddings,
    required this.selectedItems,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleTextWidget(title: title),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: size.height * 0.055, // Fixed height for the ListView
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: listtype.length,
              itemBuilder: (context, index) {
                final item = listtype[index];
                final isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () => onItemTapped(item),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    padding: EdgeInsets.symmetric(
                        horizontal: paddings ?? size.width * 0.04),
                    decoration: ShapeDecoration(
                      color: isSelected
                          ? AppColor.appBarColor
                          : AppColor.drawerBgColor,
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
                    child: Text(listtype[index],
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
          ),
        ),
      ],
    );
  }
}
