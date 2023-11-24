import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/components/user_card_widget.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/homepage/components/payslip.dart';
import 'package:mini_projeto/screens/homepage/components/requests.dart';
import 'package:provider/provider.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody({super.key});

  @override
  State<HomepageBody> createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<StateManager>(context, listen: false).userData;
    return Padding(
      padding: const EdgeInsets.all(normalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Olá, ',
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: <TextSpan>[
                    TextSpan(
                        text: '${user!.name}!',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Icon(
                Icons.assignment_ind,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              )
            ],
          ),
          const UserCardWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: hugePadding),
            child: PayslipWidget(),
          ),
          RequestWidget()
        ],
      ),
    );
  }
}
