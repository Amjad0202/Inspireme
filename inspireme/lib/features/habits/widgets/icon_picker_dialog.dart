// lib/features/habits/widgets/icon_picker_dialog.dart
import 'package:flutter/material.dart';

class IconPicker extends StatefulWidget {
  final String selectedIcon;
  final Function(String) onIconSelected;

  const IconPicker({
    Key? key,
    required this.selectedIcon,
    required this.onIconSelected,
  }) : super(key: key);

  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _iconCodes = [
    '0xe87c', // fitness
    '0xe7f6', // mood
    '0xe547', // meditation
    '0xe3f4', // book
    '0xe57f', // water
    '0xe566', // run
    '0xe318', // breakfast
    '0xef49', // sleep
    '0xe434', // code
    '0xe3e2', // bike
    '0xe3ab', // guitar
    '0xe549', // music
  ];

  List<String> _filteredIcons = [];

  @override
  void initState() {
    super.initState();
    _filteredIcons = _iconCodes;
  }

  void _filterIcons(String query) {
    setState(() {
      _filteredIcons = _iconCodes.where((code) {
        final icon = IconData(int.parse(code), fontFamily: 'MaterialIcons');
        return icon.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Icon'),
      content: Container(
        width: 300,
        height: 400,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search icons',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filterIcons,
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _filteredIcons.length,
                itemBuilder: (context, index) {
                  final iconCode = _filteredIcons[index];
                  final isSelected = widget.selectedIcon == iconCode;
                  
                  return InkWell(
                    onTap: () => widget.onIconSelected(iconCode),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected 
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : null,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected 
                              ? Theme.of(context).primaryColor
                              : Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Icon(
                        IconData(int.parse(iconCode), fontFamily: 'MaterialIcons'),
                        color: isSelected 
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}