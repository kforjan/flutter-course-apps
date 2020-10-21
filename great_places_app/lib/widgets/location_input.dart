import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen.',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
