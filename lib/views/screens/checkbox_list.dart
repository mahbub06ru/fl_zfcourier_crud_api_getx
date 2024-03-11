import 'package:flutter/material.dart';

class ListItem {
  final int id;
  final String name;

  ListItem({required this.id, required this.name});
}

class DynamicCheckboxListExample extends StatefulWidget {
  @override
  _DynamicCheckboxListExampleState createState() => _DynamicCheckboxListExampleState();
}

class _DynamicCheckboxListExampleState extends State<DynamicCheckboxListExample> {
  List<ListItem> items = [];
  List<int> selectedIds = [];

  @override
  void initState() {
    super.initState();
    // Generate sample items
    items = List.generate(
      10,
          (index) => ListItem(id: index, name: 'Item $index'),
    );
  }

  void toggleCheckbox(int id) {
    setState(() {
      if (selectedIds.contains(id)) {
        selectedIds.remove(id);
      } else {
        selectedIds.add(id);
      }
    });
  }

  bool isItemChecked(int id) {
    return selectedIds.contains(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Checkbox List Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          ListItem item = items[index];
          return CheckboxListTile(
            title: Text(item.name),
            value: isItemChecked(item.id),
            onChanged: (value) {
              toggleCheckbox(item.id);
            },
            controlAffinity: ListTileControlAffinity.leading, // Align checkbox icon to the left
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Do something with selectedIds
          for (var id in selectedIds) {
            print(id);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}


