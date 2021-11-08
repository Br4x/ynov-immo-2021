import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../api.dart';
import 'package:confetti/confetti.dart';

class Body extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ConfettiController controllerTopCenter;

  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
  }

  void initController() {
    controllerTopCenter =
        ConfettiController(duration: const Duration(microseconds: 1));
  }

  //confetti
  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(20, 20),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.directional,
        maxBlastForce: 20,
        // set a lower max blast force
        minBlastForce: 10,
        // set a lower min blast force
        emissionFrequency: 1,
        numberOfParticles: 5,
        // a lot of particles at once
        gravity: 0,
      ),
    );
  }

  //Variable qui représente l'action de l'icone "petit oeil" du password
  bool _isHidden = true;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.lightGreenAccent,
    //primary: Colors.lightGreenAccent,
    //minimumSize: Size(88, 36),
    padding: EdgeInsets.all(12),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'teddy',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.asset('assets/images/teddy.png'),
      ),
    );

    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'blacktechstudio.dev@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
      ),
    );

    // fonction permettant de voir ou de cacher le password
    void _togglePasswordView() {
      setState(() {
        _isHidden = !_isHidden;
      });
    }

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      //initialValue: 'some password',
      obscureText: _isHidden,
      decoration: InputDecoration(
        hintText: 'Password',
        suffix: InkWell(
          //Icone petit oeil
          onTap: _togglePasswordView,
          child: Icon(
            _isHidden ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
      ),
    );

//--------------------------------------------------------------------------------------------------------------------------
    //récupère les informations de la BDD via json
    Future<Map<String, dynamic>> getUsers() async {
      final response = await http.get('http://10.33.16.55:8080/api/v1/user/',
          headers: {"Access-Control-Allow-Origin": "*"});
      if (response.statusCode == 200) {
        return await json.decode(response.body);
      } else {
        throw Exception('Failed to load post');
      }
    }

    //crée une liste avec touts les users
    Future<List<User>> fetchUser() async {
      List<User> users = [];
      getUsers();
      var response = await getUsers().then((response) {
        for (int i = 0; i < response.length; i++) {
          int id = response['data'][i.toString()]['id'];
          String email = response['data'][i.toString()]['email'];
          String password = response['data'][i.toString()]['password'];
          String avatar = response['data'][i.toString()]['avatar'];
          String first_name = response['data'][i.toString()]['first_name'];
          String last_name = response['data'][i.toString()]['last_name'];
          String address = response['data'][i.toString()]['address'];
          String zip_code = response['data'][i.toString()]['zip_code'];
          String city = response['data'][i.toString()]['city'];
          String latitude = response['data'][i.toString()]['latitude'];
          String longitude = response['data'][i.toString()]['longitude'];
          User user = new User(id, email, password, avatar, address, first_name,
              last_name, zip_code, city, latitude, longitude);
          users.add(user);
        }
        ;
      });
      //print (users[0]);
      return users;
    }

    //Pop Up une fois connecté
    Future<void> _popUpConnect() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ynov-Immobilier'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('Vous êtes connecté'),
                ],
              ),
            ),
            actions: <Widget>[
              buildConfettiWidget(controllerTopCenter, 1),
              buildConfettiWidget(controllerTopCenter, 2),
              buildConfettiWidget(controllerTopCenter, 3),
              buildConfettiWidget(controllerTopCenter, 4),
              buildConfettiWidget(controllerTopCenter, 5),
              buildConfettiWidget(controllerTopCenter, 6),
              buildConfettiWidget(controllerTopCenter, 7),
              buildConfettiWidget(controllerTopCenter, 8),
              buildConfettiWidget(controllerTopCenter, 9),
              buildConfettiWidget(controllerTopCenter, 10),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();

                  // TODO Rajouter le lien pour la page d'après
                },
              ),
            ],
          );
        },
      );
    }

    //Pop Up si email ou mdp pas correcte
    Future<void> _popUpFailConnect() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ynov-Immobilier'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                      "Erreur d'email ou de mot de passe, veuillez réssayer !"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // TODO Rajouter le lien pour la page d'après
                },
              ),
            ],
          );
        },
      );
    }

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        onPressed: () async {
          controllerTopCenter.play();
          List<User> users = await fetchUser();

          int isValid = 0;

          for (int i = 0; i < users.length; i++) {
            if (users[i].email == emailController.text) {
              if (users[i].password == passwordController.text) {
                isValid = 1;
                break;
              }
            } else {
              isValid = 0;
            }
          }
          if (isValid == 1) {
            controllerTopCenter.play();
            _popUpConnect();
          } else {
            _popUpFailConnect();
          }
        },
        child: Text(
          "Log In",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            //forgotLabel, Pour plus tard, FORGOT PASSWORD
          ],
        ),
      ),
    );
  }
}
