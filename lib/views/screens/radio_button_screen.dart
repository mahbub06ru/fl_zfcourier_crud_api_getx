import 'package:flutter/material.dart';

class ListItem {
  final int id;
  final String name;

  ListItem({required this.id, required this.name});
}

class DynamicRadioButtonListExample extends StatefulWidget {
  @override
  _DynamicRadioButtonListExampleState createState() => _DynamicRadioButtonListExampleState();
}

class _DynamicRadioButtonListExampleState extends State<DynamicRadioButtonListExample> {
  List<ListItem> items = [];
  int? selectedId;

  @override
  void initState() {
    super.initState();
    // Generate sample items
    items = List.generate(
      10,
          (index) => ListItem(id: index, name: 'Item $index'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Radio Button List Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          ListItem item = items[index];
          return RadioListTile<int>(
            title: Text(item.name),
            value: item.id,
            groupValue: selectedId,
            onChanged: (value) {
              setState(() {
                selectedId = value;
              });
            },
            controlAffinity: ListTileControlAffinity.leading, // Align radio button icon to the left
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Do something with selectedId
          if (selectedId != null) {
            print(selectedId);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}


