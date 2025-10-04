import 'package:flutter/material.dart';
import 'package:note_apppp/widget/constance.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, this.maxLines = 1,@required this.onSaved, this.onChanged, this.controller, @required this.hint});

   final String? hint;
   final int maxLines;
   final Function(String?)? onSaved;
   final Function(String?)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty??true){
          return 'يجب ادخال البيانات';
        }else{
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: kPrimaryColor),
        border: buildOutlineInputBorder(kPrimaryColor),
        enabledBorder: buildOutlineInputBorder(kPrimaryColor)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
          color: color ?? Colors.white
      )
      );
  }
}
