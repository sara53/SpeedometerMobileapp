import 'package:flutter/material.dart';

class MeasuredSpeed extends StatelessWidget {
  final Function measuredSpeed;
  final String headText;

  MeasuredSpeed(this.measuredSpeed,this.headText);

  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
          
              Text(headText,
              style: TextStyle(
                fontSize: 22,
                ),
              ),
            
           
              Text(measuredSpeed().toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.green
                ) ,
              ),
           
              Text("Seconds",
              style: TextStyle(
                fontSize: 23,
                ) 
                ),
           

          ],
        );
              
  }
}