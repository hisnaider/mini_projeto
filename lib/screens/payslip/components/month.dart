import 'package:flutter/material.dart';
import 'package:mini_projeto/contants.dart';

class Month extends StatelessWidget {
  const Month({super.key, required this.index, required this.monthSelected});
  final int index;
  final int monthSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Theme.of(context).colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${kmonthNames[index]!.substring(0, 3).toUpperCase()}",
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: monthSelected == index
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: 4,
            curve: Curves.easeIn,
            width: monthSelected == index ? 60 : 0,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
