import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/models/user.dart';
import 'package:provider/provider.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserModel userData =
        Provider.of<StateManager>(context, listen: false).userData!;

    return Container(
      padding: const EdgeInsets.all(10),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Vinculo (Orgão - Uorg - Matricula)",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Text(
            "${userData.agency} - ${userData.unit} - ${userData.registration}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Text(
            "Cargo",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          Text(
            userData.role,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
