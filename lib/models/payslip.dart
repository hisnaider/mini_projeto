class PayslipModel {
  late String id;
  late Map<String, double> salary;
  late int month;
  late int year;

  PayslipModel(
      {required this.id,
      required this.salary,
      required this.month,
      required this.year});
}
