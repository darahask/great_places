import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place.dart';
import 'package:great_places/screens/places_detail.dart';
import 'package:great_places/screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesListScreen(),
        routes: {
          AddPlace.routeName: (ctx) => AddPlace(),
          PlaceDetailScreen.routeName: (ctx)=> PlaceDetailScreen(),
        },
      ),
    );
  }
}
