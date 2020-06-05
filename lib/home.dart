
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
      //updateLocation();
      super.initState();
  
      _geolocator = Geolocator();
      LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);
  
      checkPermission();
  
      _geolocator.getPositionStream(locationOptions).listen(
              (Position position) {
            _position = position;
          });
    }
  
  var renderTime = "";
  var renderTime2 = "";

    
    Stopwatch _time = new Stopwatch();
    void updateLocation() async {
      try {

        Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

        
   
        setState(() {
          
          _position = newPosition;
          getSpeed = (_position.speed*3.6).toStringAsFixed(10);

        
          if((_position.speed*3.6) >= 10.0 && (_position.speed*3.6) <= 30.0){
            _time.start();
            print(_position.speed*3.6);
            
           renderTime= (_time.elapsedMilliseconds * 0.001).toString(); 
          
          }
           if((_position.speed*3.6) >= 30.0 || (_position.speed*3.6)<=10){
             _time.reset();
           }


          if((_position.speed*3.6) == 30.0){
            if((_position.speed*3.6) <=10.0){
              _time.start();
              renderTime2= (_time.elapsedMilliseconds * 0.001).toString(); 
            }
          }

        



        });

      } catch (e) {
        print('Error: ${e.toString()}');
      }
    }
  




String measuredSpeedFrom30To10(){
  return renderTime; 
}

String measuredSpeedFrom10To30(){

  
  return renderTime2; //time;
  
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