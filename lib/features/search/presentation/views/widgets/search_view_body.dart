import 'package:flutter/material.dart';
import 'package:movies_land/constats.dart';
import 'package:movies_land/core/widgets/custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 500,
          child: CustomTextField(hintText: 'Search', prefixIcon: Icons.search),
        ),
      ),
    );
  }
}
