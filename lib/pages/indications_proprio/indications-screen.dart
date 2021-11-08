import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/indications_proprio/components/body.dart';
import 'package:ynov_immo/pages/indications_proprio/components/app_bar.dart';
import 'package:animated_background/animated_background.dart';
import 'package:ynov_immo/pages/indications_proprio/components/bottomAppBar.dart';


class IndicationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: indicationsAppBar(context),
      body: Body(),
    );
  }
}
