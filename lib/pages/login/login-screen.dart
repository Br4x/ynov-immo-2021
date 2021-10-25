import 'package:flutter/material.dart';
import 'package:ynov_immo/constants.dart';
import 'package:ynov_immo/pages/login/components/body.dart';
import 'components/app_bar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: loginAppBar(context),
      body: Body(),
    );
  }
}