import 'package:flutter/material.dart';

class ElectriciansTab extends StatefulWidget {
  const ElectriciansTab({super.key});

  @override
  State<ElectriciansTab> createState() => _ElectriciansTabState();
}

class _ElectriciansTabState extends State<ElectriciansTab> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Electricians tab'));
  }
}
