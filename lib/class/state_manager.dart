import 'package:flutter/material.dart';
import 'package:mini_projeto/models/payslip.dart';
import 'package:mini_projeto/models/user.dart';

class StateManager extends ChangeNotifier {
  UserModel? _userData;
  PayslipModel? _lastPayslip;

  UserModel? get userData {
    return _userData;
  }

  PayslipModel? get lastPayslip {
    return _lastPayslip;
  }

  void setUserData(
      Map<String, dynamic> data, Map<String, dynamic> payslip) async {
    try {
      _userData = UserModel(
        id: data["id"],
        createDate: DateTime.parse(data["createDate"]),
        name: data["name"],
        email: data["email"],
        role: data["role"],
        agency: data["agency"],
        registration: data["registration"],
        unit: data["unit"],
      );
      _lastPayslip = PayslipModel(
        id: payslip["id"],
        salary: {
          "gross": payslip["gross"].toDouble(),
          "discounts": payslip["discount"].toDouble(),
          "liquid":
              payslip["gross"].toDouble() - payslip["discount"].toDouble(),
        },
        month: payslip["month"],
        year: payslip["year"],
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
