// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mini_projeto/class/state_manager.dart';
import 'package:mini_projeto/contants.dart';
import 'package:mini_projeto/screens/empty/body.dart';
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
  int currentIndex = 0;

  void getData() async {
    MockAPI mockAPI = MockAPI();
    Map<String, dynamic> user = await mockAPI.getUser(userId);
    Map<String, dynamic> payslip = await mockAPI.getLastPayslips(userId);
    Provider.of<StateManager>(context, listen: false)
        .setUserData(user, payslip);
    setState(() {
      fetchData = false;
    });
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                const Icon(
                  Icons.menu_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "image/gov.png",
                  height: 30,
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
            SizedBox(width: 10),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.home_rounded,
                size: 35,
                color: currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "Início",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.list_rounded,
                size: 35,
                color: currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "Solicitações",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_rounded,
                size: 35,
                color: currentIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
              label: "Meu Perfil",
            ),
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: changePage,
        ),
        body: fetchData
            ? const Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              )
            : [
                const HomepageBody(),
                const EmptyBody(),
                const EmptyBody()
              ][currentIndex]);
  }
}
