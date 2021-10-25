import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ynov_immo/constants.dart';
import 'package:ynov_immo/pages/login/login-screen.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black54,
    elevation: 1,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Ynov",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Immo",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.login),
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginScreen();
              },
            ),
          );

        },
      ),
    ],

  );
}
