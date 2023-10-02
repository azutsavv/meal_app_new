import 'package:flutter/material.dart';
import 'package:new_meal_app/widgets/filters_widget.dart';
// import 'package:new_meal_app/Screenn/main_drawer.dart';
// import 'package:new_meal_app/Screenn/tabs.dart';
// import 'package:new_meal_app/main.dart';

enum Filter {
  gluteenfree,
  lactosefrree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluteenFilterSet = false;
  var _lactoseFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.gluteenfree: _gluteenFilterSet,
          Filter.lactosefrree: _lactoseFilterSet,
          Filter.vegan: _veganFilterSet,
          Filter.vegetarian: _vegetarianFilterSet,
        });
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Yours Filters"),
        ),
        // drawer: mainDrawer(
        //   onselectscren: (identifier) {
        //     Navigator.of(context).pop();
        //     if(identifier=="meals"){
        //       Navigator.of(context).pushReplacement
        //       (MaterialPageRoute(builder:(ctx) =>const tabs() ,))
        //     }
        //   },
        // ),
        body: Column(
          children: [
            filtertype(
              type: _gluteenFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _gluteenFilterSet = newValue;
                });
              },
              title: "Gluteen-Free",
              subtitle: "food is gluteen free",
            ),
            filtertype(
                type: _lactoseFilterSet,
                onChanged: (newValue) {
                setState(() {
                  _lactoseFilterSet= newValue;
                });
              },
                title: "Lactose-Free",
                subtitle: "food is lactose free"),
            filtertype(
                type: _vegetarianFilterSet,
                onChanged: (newValue) {
                setState(() {
                 _vegetarianFilterSet  = newValue;
                });
              },
                title: "Vegetarian",
                subtitle: "food is vegetarian"),
            filtertype(
                type: _veganFilterSet,
                onChanged: (newValue) {
                setState(() {
                  _veganFilterSet = newValue;
                });
              },
                title: "vegan",
                subtitle: "food is vegan"),
          ],
        ),
      ),
    );
  }
}
