import 'package:flutter/material.dart';
import 'package:meals_app/screens/views/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen({Key? key, required this.saveFilters, required this.currentFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegatarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegatarian = widget.currentFilters['vegeterian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    final void Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final seelectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegeterian': _vegatarian,
                  };
                  widget.saveFilters(seelectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (value) => setState(() {
                          _glutenFree = value;
                        })),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    (value) => setState(() {
                          _lactoseFree = value;
                        })),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegatarian,
                    (value) => setState(() {
                          _vegatarian = value;
                        })),
                _buildSwitchListTile(
                    'Vegan',
                    'Only include vegetarian meals',
                    _vegatarian,
                    (value) => setState(() {
                          _vegatarian = value;
                        })),
              ],
            ))
          ],
        ));
  }
}
