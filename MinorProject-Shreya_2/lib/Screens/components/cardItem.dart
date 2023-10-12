import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
 @override

 Color cardColor = Color.fromRGBO(0x74, 0x74, 0x74, 0.08);
  Widget build( BuildContext context){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Container(
         height: 180,
         width: 160,
         decoration: BoxDecoration(color:cardColor ),
       )
     ],
   );
 }
}