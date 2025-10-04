import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_apppp/cubit/cubits_add_note_cubits/add_note_cubit.dart';

import 'constance.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(backgroundColor: color, radius: 34),
          )
        : CircleAvatar(radius: 38, backgroundColor: color);
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 38 * 2,
        child: ListView.builder(
          itemCount: kColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = kColor[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: kColor[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
