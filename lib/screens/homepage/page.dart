import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/homepage/body.dart';
import 'package:mini_projeto/services/mock_api.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool fetchData = true;

  void getData() async {
    MockAPI mockAPI = MockAPI();
    Map<String, dynamic> user =
        await mockAPI.getUser("6123b7b7f72a5e8a91d6bd44");
    print(user);
    print(user.runtimeType);
    Map<String, dynamic> payslip =
        await mockAPI.getLastPayslips("6123b7b7f72a5e8a91d6bd44");
    print(payslip);
    print(payslip.runtimeType);
    Provider.of<StateManager>(context, listen: false)
        .setUserData(user, payslip);
    setState(() {
      fetchData = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: normalPadding - 3),
          child: Row(
            children: [
              Icon(
                Icons.menu_rounded,
                size: 30,
                color: Colors.white,
              )
            ],
          ),
        ),
        titleSpacing: 0,
        actions: const [
          Badge(
            label: Text("99+"),
            textStyle: TextStyle(),
            child: Icon(
              Icons.notifications,
            ),
          ),
          SizedBox(width: 24),
          Icon(Icons.logout_rounded),
          SizedBox(width: normalPadding),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 35,
            ),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
              size: 35,
            ),
            label: "Solicitações",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              size: 35,
            ),
            label: "Meu Perfil",
          ),
        ],
      ),
      body: fetchData
          ? const Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            )
          : const HomepageBody(),
    );
  }
}
