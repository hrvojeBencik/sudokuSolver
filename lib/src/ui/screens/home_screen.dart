import 'package:flutter/material.dart';
import 'package:sudoku_solver/src/constants/routes.dart';
import 'package:sudoku_solver/src/settings/settings_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku Solver'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.solverScreen),
              child: const Text('Go to solver'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, SettingsView.routeName),
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
