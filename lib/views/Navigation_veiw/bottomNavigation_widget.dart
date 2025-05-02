import 'package:badi/constants/Colors.dart';
import 'package:badi/views/Navigation_veiw/nav_blueprint.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BottomnavigationWidget extends StatelessWidget {

  final int selectedIndex;
  final Function(int) whentapped; 
  const BottomnavigationWidget({super.key, required this.selectedIndex, required this.whentapped});
//UI REPRESENTATION OF EACH BUTTON
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kBackground,
      ),

      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          NavBluePrint(
            label: 'Home', 
            onTap: (){whentapped(0);}, 
            isSelected: selectedIndex == 0, 
            selectedIcon: IconsaxPlusBold.home_1, 
            unselectedIcon: IconsaxPlusLinear.home_1,
            ),

             NavBluePrint(
            label: 'Discover' , 
            onTap: (){whentapped(1);}, 
            isSelected: selectedIndex == 1, 
            selectedIcon: IconsaxPlusBold.search_normal, 
            unselectedIcon: IconsaxPlusLinear.search_normal,
            ),

            NavBluePrint(
            label: 'Whitelisted', 
            onTap: (){whentapped(2);}, 
            isSelected: selectedIndex ==2, 
            selectedIcon: IconsaxPlusBold.archive_minus, 
            unselectedIcon: IconsaxPlusLinear.archive_minus,
            ),


             NavBluePrint(
            label: 'Me', 
            onTap: (){whentapped(3);}, 
            isSelected: selectedIndex ==3, 
            selectedIcon: IconsaxPlusBold.profile_2user,
             unselectedIcon:IconsaxPlusLinear.profile_2user,
            ),
        ],

      ),
    );
  }
}