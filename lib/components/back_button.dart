import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}
