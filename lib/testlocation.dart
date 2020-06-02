
  import 'package:flutter/material.dart';
  import 'package:geolocator/geolocator.dart';

  class GeolocationExample extends StatefulWidget{

  @override
  State<StatefulWidget> createState() =>  GeolocationExampleState();

  }
 
  class GeolocationExampleState extends State<GeolocationExample> {
   
    Position _position;
 
    @override
    void initState() {
      super.initState();
 
       Geolocator();
    }
 
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Geolocation Example'),
        ),
        body: Center(
            child: Text(
               'Latitude: ${_position != null ? _position.latitude.toString() : '0'},'
                  ' Longitude: ${_position != null ? _position.longitude.toString() : '0'}'
            )
        ),
      );
    }
  }