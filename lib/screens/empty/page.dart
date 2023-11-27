import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto/screens/empty/body.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(true),
          child: const Padding(
            padding: EdgeInsets.only(left: 3),
            child: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
        leadingWidth: 26,
      ),
      body: const EmptyBody(),
    );
  }
}
