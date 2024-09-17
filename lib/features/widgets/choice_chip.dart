import 'package:flutter/material.dart';
import 'package:wizwords/const.dart';

class AgeChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final void Function(bool) onSelected;

  const AgeChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selectedColor: secondaryColor, 
      backgroundColor: KPrimaryColor, 
      label: Text(
        label,
        style: const TextStyle(
          color: mainColor,
          fontSize: 18,
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8), 
        side: BorderSide.none,
      ),
    );
  }
}
