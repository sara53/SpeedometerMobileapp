

import 'dart:async';

import 'package:flutter/material.dart';
import 'currentSpeed.dart';
import 'measuedSpeed.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget{
  
  @override
  MyHomePageState createState() =>MyHomePageState();
  
}



class MyHomePageState  extends State<MyHomePage> {


 Geolocator _geolocator;
 Position _position ;
String getSpeed = "";
  
    void checkPermission() {
      _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
      _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
      _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
    }
  
    @override
    void initState() {
      super.initState();
  
      _geolocator = Geolocator();
      LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);
  
      checkPermission();
  
      _geolocator.getPositionStream(locationOptions).listen(
              (Position position) {
            _position = position;
          });
    }
  
    void updateLocation() async {
      try {

        Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  
        setState(() {
          _position = newPosition;
          getSpeed = (_position.speed/3.6).toStringAsFixed(10);
        });
      } catch (e) {
        print('Error: ${e.toString()}');
      }
    }
  




double measuredSpeedFrom30To10(){

double v0 = 0.0;
double  a =  0.0;
double time = 0.0;
 Timer(Duration(seconds: 1),(){
        
       
        var vt = (_position.speed/3.6);
        var deltaV = (vt-v0);
        v0 = vt;
         a = deltaV/(1);
        
        if(a>0.0){
         int deltaGoal = (30 - 10);
         time = deltaGoal / a;
        }
        

     }
);

  return  time;
}

double measuredSpeedFrom10To30(){


double v0 = 0.0;
double  a =  0.0;
double time = 0.0;
 Timer(Duration(seconds: 1),(){
        
        
        var vt = (_position.speed/3.6);
        var deltaV = (vt-v0);
        v0 = vt;
         a = deltaV/(1);
        if(a<0.0){
         int deltaGoal = (10 - 30);
         time = deltaGoal / a;
        }
        

     }
);

  return  time;
  
}
 

  @override
  Widget build(BuildContext context) {
    //getCurrentLocation();
    updateLocation();
    return Scaffold(
      
      body: Container(
        padding: EdgeInsets.only(top: 80),
        child: Center(
          child: Column(
            children: <Widget>[
              
              CurrentSpeed(getSpeed),     
              MeasuredSpeed(measuredSpeedFrom10To30,"From 10 To 30"),
              Container(
                padding: EdgeInsets.only(top: 30),
                child:MeasuredSpeed(measuredSpeedFrom30To10,"From 30 To 10") ,
              )
              
          
            ],
          ),
        ),
      )
    );
  }
}