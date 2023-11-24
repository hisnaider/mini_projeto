import 'package:flutter/material.dart';
import 'package:mini_projeto/contants.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Solicitações",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "Envie requerimentos para a sua Unidade Gestora",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Row(
          children: [
            _RequestCart(
              icon: Icons.local_hospital_rounded,
              title: "Saúde Suplementar",
            ),
            SizedBox(width: normalPadding),
            _RequestCart(
              icon: Icons.group,
              title: "Cadastro de dependente",
            ),
            SizedBox(width: normalPadding),
            _RequestCart(
              icon: Icons.house_rounded,
              title: "Morada",
            ),
          ],
        )
      ],
    );
  }
}

class _RequestCart extends StatelessWidget {
  const _RequestCart({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 45,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
