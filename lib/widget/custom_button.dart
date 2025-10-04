import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constance.dart';

class AddCustomButton extends StatelessWidget {
   AddCustomButton({super.key,required this.onTap,  this.isLoading = false});
final bool isLoading;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kPrimaryColor
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: isLoading? CircularProgressIndicator(
            color: Colors.black,
          )
              : Text('Add',
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),
      ),
    );
  }
}