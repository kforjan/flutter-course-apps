import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';
import '../providers/places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<Places>(
                child: Center(
                  child: const Text('No places yet.'),
                ),
                builder: (context, places, child) => places.items.length <= 0
                    ? child
                    : ListView.builder(
                        itemCount: places.items.length,
                        itemBuilder: (context, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(places.items[i].image),
                          ),
                          title: Text(places.items[i].title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
