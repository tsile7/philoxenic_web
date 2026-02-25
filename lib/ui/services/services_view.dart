import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: GridView.count(
        padding: const EdgeInsets.all(32),
        crossAxisCount: 2,
        children: const [
          Card(
            child: Center(child: Text('SaaS Platforms')),
          ),
          Card(
            child: Center(child: Text('Mobile Applications')),
          ),
        ],
      ),
    );
  }
}
