import 'package:badi/Core/constants/Colors.dart';
import 'package:flutter/material.dart';

//MORE OF THE BLUE PRINT AN ICON
class NavBluePrint extends StatelessWidget {
  final String label;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final VoidCallback onTap;
  final bool isSelected;

  const NavBluePrint({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
    required this.selectedIcon,
    required this.unselectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected ? kPrimary : Colors.black54;
    final IconData icon = isSelected ? selectedIcon : unselectedIcon;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
