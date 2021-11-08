import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:ynov_immo/api.dart';
import 'package:ynov_immo/pages/indications_proprio/components/IndicationsController.dart';
import 'package:ynov_immo/pages/indications_proprio/components/bottomAppBar.dart';
import 'package:ynov_immo/pages/indications_proprio/components/checkbox_state.dart';

class MainPageState extends StatefulWidget {
  const MainPageState({
    Key key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageState> {
    final titre = [
    CheckBoxState(id: 1, titre: "J'ai le total en cash"),
    CheckBoxState(id: 2, titre: "Apport financier"),
    CheckBoxState(id: 3, titre: "Apport financier important ( > 30% du bien"),
    CheckBoxState(
        id: 4, titre: "Apport financier très important ( > 70% du bien"),
    CheckBoxState(id: 5, titre: "J'aimerai une vente longue"),
  ];

  List<int> selecteditems = [];
  bool _hasBeenPressed = false;

  // méthode pour récuperer toutes les valeurs des checkbox qu'on ajoute dans une liste
  void _onCategorySelected(int id, bool value) {
    if (value == true) {
      setState(() {
        selecteditems.add(id);
      });
    } else {
      setState(() {
        selecteditems.remove(id);
      });
    }
  }

  // méthode pour récupérer la valeur actuelle de valueHasTotalInCash
  int valueHasTotalInCash() {
    int valueFinal = 0;
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == 1) {
        valueFinal = 1;
      } else {}
    }
    return valueFinal;
  }

  int valueHasFinancialSupport() {
    int valueFinal = 0;
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == 2) {
        valueFinal = 1;
      } else {}
    }
    return valueFinal;
  }

  int valueHasBigFinancialSupport() {
    int valueFinal = 0;
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == 3) {
        valueFinal = 1;
      } else {}
    }
    return valueFinal;
  }

  int valueHasVeryBigFinancialSupport() {
    int valueFinal = 0;
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == 4) {
        valueFinal = 1;
      } else {}
    }
    return valueFinal;
  }

  int valueWantALongSell() {
    int valueFinal = 0;
    for (int i = 0; i < selecteditems.length; i++) {
      if (selecteditems[i] == 5) {
        valueFinal = 1;
      } else {}
    }
    return valueFinal;
  }

  // rénitialise les checkbox
  void reset(){
    for (int i = 0; i < titre.length; i++){
      titre[i].setValue = false;
    }
    selecteditems.clear();
    setState(() {
    });
  }

  Widget build(BuildContext context) =>
      Scaffold(
        body:
          ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "Indications au propriétaire",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            Divider(color: Colors.black45, height: 20,),
            ...titre.map(buildSingleCheckbox).toList(),
            new Image.asset('assets/images/fond-immobilier.jpg'
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amberAccent,
          onPressed: () {
            _showMyDialog();
          },
          icon: Icon(Icons.send),
          label: Text("Envoyer"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: indicationsBottomAppBar(context),
      );

  Widget buildSingleCheckbox(CheckBoxState checkBox) =>
      CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.red,
        value: checkBox.value,
        title: Text(
          checkBox.titre,
          style: TextStyle(fontSize: 15),
        ),
        onChanged: (bool value) {
          setState(() {
            checkBox.value = value;
            _onCategorySelected(checkBox.id, checkBox.value);
            valueHasTotalInCash();
            valueHasFinancialSupport();
            valueHasBigFinancialSupport();
            valueHasVeryBigFinancialSupport();
            valueWantALongSell();
          });
        },
      );

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Merci de confirmer'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Etes-vous sûr de vouloir continuer ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Oui'),
              onPressed: () {
                print('Confirmed');
                var body = new RealEstatePropalsBuyerIndication(7, 3, 2, 1, valueHasTotalInCash(), valueHasFinancialSupport(), valueHasBigFinancialSupport(), valueHasVeryBigFinancialSupport(), valueWantALongSell()); // RealEstatePropalsBuyerIndication | create real-estate-propals-buyer-indication
                IndicationsController().sendData(body);
                reset();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Non'),
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

