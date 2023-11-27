import 'package:flutter/material.dart';

class PayslipOptions extends StatelessWidget {
  const PayslipOptions(
      {super.key, required this.title, required this.selected});
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: selected ? Theme.of(context).colorScheme.surface : null,
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
