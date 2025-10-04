import 'package:flutter/material.dart';
import 'package:note_apppp/widget/notes_item.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.iconData,  this.onPressed});
final String title;
final IconData iconData;
  final void Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
              fontSize: 30
          ),),
          Container(
            height: 45,width: 45,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child:  Center(
              child: IconButton(onPressed: onPressed,
                  icon: Icon(iconData),  iconSize: 35,
                  color: Colors.white),
            ),
          ),
        ],

      ),
    );
  }
}




