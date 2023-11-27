import 'package:flutter/material.dart';
import 'package:mini_projeto/components/user_card_widget.dart';
import 'package:mini_projeto/screens/empty/body.dart';
import 'package:mini_projeto/screens/payslip/components/detailed_payslip.dart';
import 'package:mini_projeto/screens/payslip/components/month.dart';
import 'package:mini_projeto/screens/payslip/components/payslip_options.dart';

class PayslipBody extends StatefulWidget {
  const PayslipBody({super.key});

  @override
  State<PayslipBody> createState() => _PayslipBodyState();
}

class _PayslipBodyState extends State<PayslipBody> {
  int monthSelected = 11;
  int payslipOptionSelected = 0;

  void selectMonth(int index) {
    setState(() {
      monthSelected = index;
    });
  }

  void changePayslipOption(int index) {
    setState(() {
      payslipOptionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> payslipOptions = [
      "Contracheque detalhado",
      "Gráficos do contracheque",
      "Evolução remuneratório",
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        children: [
          const UserCardWidget(),
          Divider(
            thickness: 1,
            height: 35,
            color: Theme.of(context).colorScheme.surface,
          ),
          SizedBox(
            height: 30,
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
          const SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < payslipOptions.length; i++) ...[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        changePayslipOption(i);
                      },
                      child: PayslipOptions(
                        title: payslipOptions[i],
                        selected: payslipOptionSelected == i,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
              child: [
            const DetailedPayslip(),
            const EmptyBody(),
            const EmptyBody()
          ][payslipOptionSelected]),
        ],
      ),
    );
  }
}
