import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/contants.dart';
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
        const SizedBox(height: 4),
        Text(
          "Resumo do último contracheque",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            _LastPayslip(
              payslipEnum: PayslipEnum.gross,
              value: payslip.salary["Bruto"]!,
              visible: visible,
            ),
            const SizedBox(width: 12),
            _LastPayslip(
              payslipEnum: PayslipEnum.discounts,
              value: payslip.salary["Descontos"]!,
              visible: visible,
            ),
            const SizedBox(width: 12),
            _LastPayslip(
              payslipEnum: PayslipEnum.liquid,
              value: payslip.salary["Liquido"]!,
              visible: visible,
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () => context.go("/payslip"),
            child: Row(
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
}

class _LastPayslip extends StatelessWidget {
  const _LastPayslip(
      {required this.payslipEnum, required this.value, required this.visible});
  final PayslipEnum payslipEnum;
  final double value;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.fromLTRB(4, 12, 0, 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: payslipEnum.color,
              offset: const Offset(-4, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              payslipEnum.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  visible ? "$value" : "*******",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: payslipEnum.color,
                      ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: payslipEnum.color,
                  ),
                  child: Icon(
                    payslipEnum.icon,
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
