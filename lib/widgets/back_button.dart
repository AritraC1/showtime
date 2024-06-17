
import 'package:flutter/material.dart';
import 'package:showtime/utils/colors.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      margin: const EdgeInsets.only(top: 12, left: 12),
      decoration: BoxDecoration(
          color: Colours.scaffoldBgColor,
          borderRadius: BorderRadius.circular(8)),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }
}
