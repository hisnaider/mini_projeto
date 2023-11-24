import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/components/user_card_widget.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/payslip/components/detailed_payslip.dart';
import 'package:mini_projeto/screens/payslip/components/month.dart';
import 'package:mini_projeto/screens/payslip/constants.dart';
import 'package:provider/provider.dart';

class PayslipBody extends StatefulWidget {
  const PayslipBody({super.key});

  @override
  State<PayslipBody> createState() => _PayslipBodyState();
}

class _PayslipBodyState extends State<PayslipBody> {
  int monthSelected = 11;

  void selectMonth(int index) {
    setState(() {
      monthSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final payslip =
        Provider.of<StateManager>(context, listen: false).lastPayslip!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          normalPadding, normalPadding, normalPadding, 0),
      child: Column(
        children: [
          UserCardWidget(),
          Divider(
            thickness: 1,
            height: 35,
            color: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(
            height: 30,
            child: Scrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => selectMonth(index + 1),
                    child: Month(
                      index: index + 1,
                      monthSelected: monthSelected,
                    ),
                  );
                },
              ),
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < payslipInfoList.length; i++) ...[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: i == 0
                            ? Theme.of(context).colorScheme.surface
                            : null,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        payslipInfoList[i]["pt-br"]!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
          SizedBox(height: 12),
          Expanded(child: DetailedPayslip()),
        ],
      ),
    );
  }
}
