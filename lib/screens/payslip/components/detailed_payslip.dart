import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/contants.dart';
import 'package:provider/provider.dart';

class DetailedPayslip extends StatefulWidget {
  const DetailedPayslip({super.key});

  @override
  State<DetailedPayslip> createState() => _DetailedPayslipState();
}

class _DetailedPayslipState extends State<DetailedPayslip> {
  bool showGrossList = false;
  bool showDiscountList = false;

  void openGrossList() {
    setState(() {
      showGrossList = !showGrossList;
    });
  }

  void openDiscountList() {
    setState(() {
      showDiscountList = !showDiscountList;
    });
  }

  @override
  Widget build(BuildContext context) {
    final payslip =
        Provider.of<StateManager>(context, listen: false).lastPayslip!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Icon(
              Icons.file_download_rounded,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (PayslipEnum i in PayslipEnum.values) ...[
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        kpayslip[i.name]!["name"]["pt-br"].toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kpayslip[i.name]!["color"]),
                      ),
                      Text(
                        "${payslip.salary[i.name]}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kpayslip[i.name]!["color"]),
                      )
                    ],
                  ),
                )
              ]
            ],
          ),
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: Theme.of(context).colorScheme.surface,
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: openGrossList,
                    child: _Label(
                      color: kpayslip["gross"]["color"],
                      icon: Icons.add_rounded,
                      title: "Rendimentos",
                      openList: showGrossList,
                    ),
                  ),
                  _ItemList(list: [
                    {
                      "name": "vencimento basico",
                      "value": payslip.salary["gross"]! * 0.9
                    },
                    {
                      "name": "per capita - saude suplementar",
                      "value": payslip.salary["gross"]! * 0.1
                    },
                  ], open: showGrossList),
                  const Divider(
                    thickness: 1,
                    height: 25,
                    color: Colors.black12,
                  ),
                  GestureDetector(
                    onTap: openDiscountList,
                    child: _Label(
                      color: kpayslip["discounts"]["color"],
                      icon: Icons.remove_rounded,
                      title: "Descontos",
                      openList: showGrossList,
                    ),
                  ),
                  _ItemList(list: [
                    {
                      "name": "unimed/rs per capita patroc",
                      "value": payslip.salary["discounts"]! * 0.9
                    },
                    {
                      "name": "cont. plano seguridade social",
                      "value": payslip.salary["discounts"]! * 0.1
                    },
                  ], open: showDiscountList),
                  SizedBox(height: hugePadding),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(
      {super.key,
      required this.icon,
      required this.color,
      required this.title,
      required this.openList});
  final IconData icon;
  final Color color;
  final String title;
  final bool openList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: color,
          ),
          child: Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400, color: Colors.black87),
          ),
        ),
        Icon(
          openList
              ? Icons.keyboard_arrow_down_rounded
              : Icons.keyboard_arrow_up_rounded,
          size: 25,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

class _ItemList extends StatefulWidget {
  const _ItemList({super.key, required this.list, required this.open});
  final List<Map<String, dynamic>> list;
  final bool open;

  @override
  State<_ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<_ItemList> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.open) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.vertical,
      axisAlignment: 1,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            for (int i = 0; i < widget.list.length; i++) ...[
              Padding(
                padding: const EdgeInsets.all(normalPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.list[i]["name"].toUpperCase(),
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 50),
                    Text(
                      "${widget.list[i]["value"]}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              if (i < widget.list.length - 1)
                Divider(
                  thickness: 5,
                  color: Theme.of(context).colorScheme.surface,
                  height: 0,
                )
            ]
          ],
        ),
      ),
    );
  }
}
