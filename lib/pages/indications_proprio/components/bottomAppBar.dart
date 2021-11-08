import 'package:flutter/material.dart';

BottomAppBar indicationsBottomAppBar(BuildContext context){
  return BottomAppBar(
    color: Colors.yellow,
    child: Container(height: 50,),
    shape: CircularNotchedRectangle(),
    notchMargin: 5,
  );
}