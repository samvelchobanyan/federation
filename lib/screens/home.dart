import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void changeTap(int index){
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex
      );
  }

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: changeTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Գլխավոր'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3),
            label: 'Օգտատերեր'
            ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.kayaking),
          //   label: 'Advice'
          //   ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings'
            )
          ],),
    );
  }
}