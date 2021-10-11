import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ynov_immo/pages/home/components/app_bar.dart';
import 'package:ynov_immo/api.dart';
import 'package:http/http.dart' show Client;
import 'package:ynov_immo/pages/home/home-screen.dart';

void login () {
  var apiInstance = new AuthApi();
  var user = new User(email: "admin@admin.com", password: "admin"); // User | create user

  try {
      var result = apiInstance.loginPost(user);
      print(result);
  } catch (e) {
      print("Exception when calling AuthApi->loginPost: $e\n");
  }
}

Future<bool> callApi(String email, String password) async {
    Client client = Client();
    final response = await client.get(
        //'http://api.quentinguiheneuc.fr/api/v1/user?email=' + email + '&password=' + password,
        'http://10.0.2.2:8080/api/v1/user?email=' + email + '&password=' + password,
        headers: {"Access-Control-Allow-Origin": "*"});
    if (response.statusCode == 200) {
      LinkedHashMap<String, dynamic> responseJson = json.decode(response.body.toString());
      String rspPassword = responseJson["data"]["0"]["password"];
      String rspEmail = responseJson["data"]["0"]["email"];

      if (password == rspPassword && email == rspEmail) {
        return true;
      } else {
        return false;
      }
    } else {
      throw Exception('Failed to load post');
    }
  }

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: LoginBody(),
    );
  }
}

class MyFormTextField extends StatelessWidget {
  Function(String) onSaved;
  InputDecoration decoration;
  Function(String) validator;
  final bool isObscure;

  MyFormTextField(
    {this.isObscure,
    this.decoration,
    this.validator,
    this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: decoration,
      validator: validator,
      onSaved: onSaved,
    );
  }
}

class FormSubmitButton extends StatelessWidget {
  final Function() onPressed;
  FormSubmitButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text('Connexion'),
      ),
      width: double.infinity);
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final model = User();
  final _emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: EdgeInsets.only(left:30.0, top:20.0,right:30.0,bottom:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                MyFormTextField(
                  isObscure: false,
                  decoration: InputDecoration(
                    labelText: "Login",
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Entrez une adresse email";
                    } else if (!_emailRegExp.hasMatch(value)) {
                      return "Email incorect";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    model.email = value;
                  },
                ),
                MyFormTextField(
                  isObscure: true,
                  decoration: InputDecoration(
                    labelText: "Mot de passe"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Entrez un mot de passe';
                    }
                      return null;
                  },
                  onSaved: (value) {
                    model.password = value;
                  },
                ),
                FormSubmitButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      if(await callApi(model.email, model.password)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(
                          SnackBar(content: Text('Email ou mot de passe incorect'), backgroundColor: Colors.red,));
                      }
                    }
                  },
                )
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Vous êtes nouveau ?",
                style: TextStyle(color: Colors.black),),
              TextButton(
                child: Text('C\'est par ici'),
                onPressed: () {
                  // TODO : navigation
                },
              )],
          )
        ],
      ),
    );
  }
}