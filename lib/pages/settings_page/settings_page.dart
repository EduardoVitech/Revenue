import 'package:flutter/material.dart';
import 'package:revenue/widgets/main_drawer/main_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Configurações')),
      ),
      drawer: MainDrawer(),
      body: const Center(child: Text('Configurações')),
    );
  }
}
