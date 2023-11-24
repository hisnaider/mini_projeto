import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/homepage/constants.dart';
import 'package:provider/provider.dart';

class PayslipWidget extends StatefulWidget {
  const PayslipWidget({
    super.key,
  });

  @override
  State<PayslipWidget> createState() => _PayslipWidgetState();
}

class _PayslipWidgetState extends State<PayslipWidget> {
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final payslip =
        Provider.of<StateManager>(context, listen: false).lastPayslip!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Contracheque | ${kmonthNames[payslip.month]} ${payslip.year}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            GestureDetector(
              onTap: changeVisibility,
              child: Icon(
                visible
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        SizedBox(height: 4),
        Text(
          "Resumo do último contracheque",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            SizedBox(width: 4),
            buildLastPayslip(
              payslipEnum: PayslipEnum.gross,
              value: payslip.salary["gross"]!,
            ),
            SizedBox(width: bigPadding),
            buildLastPayslip(
              payslipEnum: PayslipEnum.discounts,
              value: payslip.salary["discounts"]!,
            ),
            SizedBox(width: bigPadding),
            buildLastPayslip(
              payslipEnum: PayslipEnum.liquid,
              value: payslip.salary["liquid"]!,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => context.go("/payslip"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Meus Contracheques",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                  color: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildLastPayslip(
      {required PayslipEnum payslipEnum, required double value}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: kpayslip[payslipEnum.name]["color"],
              offset: const Offset(-4, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(normalPadding),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              kpayslip[payslipEnum.name]["name"]["pt-br"],
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  visible ? "$value" : "*******",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kpayslip[payslipEnum.name]["color"],
                      ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: kpayslip[payslipEnum.name]["color"],
                  ),
                  child: Icon(
                    kpayslip[payslipEnum.name]["icon"],
                    color: Colors.white,
                    size: 17,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
