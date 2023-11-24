import 'package:flutter/material.dart';

const double normalPadding = 10;
const double hugePadding = 24;
const double bigPadding = 12;

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

const Map<String, dynamic> kpayslip = {
  "gross": {
    "name": {
      "pt-br": "Bruto",
      "en-us": "Gross",
    },
    "color": Color.fromRGBO(39, 185, 158, 1),
    "icon": Icons.add_rounded
  },
  "discounts": {
    "name": {
      "pt-br": "Desconto",
      "en-us": "Discount",
    },
    "color": Color.fromRGBO(233, 73, 59, 1),
    "icon": Icons.remove_rounded
  },
  "liquid": {
    "name": {
      "pt-br": "Liquido",
      "en-us": "Liquid",
    },
    "color": Colors.blue,
    "icon": Icons.done_rounded
  }
};

enum PayslipEnum { gross, discounts, liquid }
