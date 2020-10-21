import 'package:flutter/material.dart';

import '../widgets/maind_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegatarian'];
    _vegan = widget.currentFilters['vegan'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegatarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                    title: Text('Gluten-free'),
                    value: _glutenFree,
                    subtitle: Text('Remove all gluten meals!'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Lactose-free'),
                    value: _lactoseFree,
                    subtitle: Text('Remove all lactose meals!'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Remove all non-vegatarian meals!'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan,
                    subtitle: Text('Remove all non-vegan meals!'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
