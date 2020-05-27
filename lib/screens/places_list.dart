import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_place.dart';
import 'package:great_places/screens/places_detail.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {

  bool init = true;

  @override
  void didChangeDependencies() {
    if(init)
      Provider.of<GreatPlaces>(context).fetchAndSetData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlace.routeName);
            },
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('No places yet'),
        ),
        builder: (ctx, gp, ch) => gp.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: gp.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(gp.items[i].image),
                  ),
                  title: Text(gp.items[i].title),
                  subtitle: Text(gp.items[i].location.address),
                  onTap: (){
                    Navigator.pushNamed(context, PlaceDetailScreen.routeName,arguments: gp.items[i].id);
                  },
                ),
              ),
      ),
    );
  }
}
