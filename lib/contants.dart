import 'package:flutter/material.dart';

const String userId = "6123b7b7f72a5e8a91d6bd44";

const Map<int, String> kmonthNames = {
  1: "Janeiro",
  2: "Fevereiro",
  3: "Março",
  4: "Abril",
  5: "Maio",
  6: "Junho",
  7: "Julho",
  8: "Agosto",
  9: "Setembro",
  10: "Outubro",
  11: "Novembro",
  12: "Dezembro",
};

enum PayslipEnum {
  gross("Bruto", Color.fromRGBO(39, 185, 158, 1), Icons.add_rounded),
  discounts("Descontos", Color.fromRGBO(233, 73, 59, 1), Icons.remove_rounded),
  liquid("Liquido", Colors.blue, Icons.done_rounded);

  const PayslipEnum(this.name, this.color, this.icon);
  final String name;
  final Color color;
  final IconData icon;
}
