import 'package:flutter/material.dart';
import 'package:stove_genie/pages/filter_screen/presentation/widget/category_container.dart';
import 'package:stove_genie/pages/filter_screen/presentation/widget/filter_row.dart';
import 'package:stove_genie/pages/filter_screen/presentation/widget/rate_container.dart';
import 'package:stove_genie/pages/filter_screen/presentation/widget/time_container.dart';
import 'package:stove_genie/widget/custom_button.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: FilterRow(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TimeContainer(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: RateContainer(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CategoryContainer(),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: CustomButton(text: 'Filter'),
        ),
      ],
    );
  }
}
