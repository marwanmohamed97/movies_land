import 'package:flutter/material.dart';
import 'package:movies_land/core/ulits/styles.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  int dropDownButoonValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 142,
      height: 48,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: DropdownButton(
            onChanged: (value) {
              dropDownButoonValue = value!;
              setState(() {});
            },
            isExpanded: true,
            underline: Container(),
            style: Styles.textStyle14
                .copyWith(fontWeight: FontWeight.w700, fontFamily: 'OpenSans'),
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(
              Icons.expand_more,
              size: 30,
            ),
            value: dropDownButoonValue,
            items: const [
              DropdownMenuItem(
                value: 0,
                child: Text('Season 1'),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text('Season 2'),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text('Season 3'),
              ),
              DropdownMenuItem(
                value: 3,
                child: Text('Season 4'),
              ),
              DropdownMenuItem(
                value: 4,
                child: Text('Season 5'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
