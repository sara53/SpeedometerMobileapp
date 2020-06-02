import 'package:flutter/material.dart';

class CurrentSpeed extends StatelessWidget {
  
  final String _locationMessage;
  CurrentSpeed(this._locationMessage);

  @override
  Widget build(BuildContext context) {
    return Column(
    
            children: <Widget>[
              
              Text("Current Speed",
              style: TextStyle(
                fontSize: 30,
                ),
              ),
        
              Text(_locationMessage,
              style: TextStyle(
                fontSize: 30,
                color: Colors.green
                ) ,
              ),
            Container(
               transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child:Text("Kmh",
                  style: TextStyle(
                    fontSize: 30,
                    ) 
                    ),
            )
                  
             
            ],
              );
  }
}