import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/home/components/body.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtres'),
      ),
      body: Body(),
    );
  }
}
