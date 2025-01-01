import 'package:flutter/material.dart';

class SelectionContainer extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onChanged;

  const SelectionContainer({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.black12,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 50,
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white10,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(width: 22),
            Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
