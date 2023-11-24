import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/payslip/body.dart';

class PayslipPage extends StatelessWidget {
  const PayslipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contracheque"),
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
      body: const PayslipBody(),
    );
  }
}
