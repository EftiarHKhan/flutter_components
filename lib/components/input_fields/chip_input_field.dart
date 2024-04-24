import 'package:flutter/material.dart';

class ChipInputField extends StatefulWidget {
  @override
  _ChipInputFieldState createState() => _ChipInputFieldState();
}

class _ChipInputFieldState extends State<ChipInputField> {
  final TextEditingController _controller = TextEditingController();
  List<String> chips = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: chips.map((chip) {
                          return Chip(
                            label: Text(chip),
                            onDeleted: () {
                              setState(() {
                                chips.remove(chip);
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(width: 8.0), // Add some spacing between the chip list and the text field
                      SizedBox(
                        width: 200, // Adjust width according to your needs
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Enter recipients',
                            border: OutlineInputBorder(),
                          ),
                          onSubmitted: (value) {
                            _addChip(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addChip(_controller.text);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _addChip(String chip) {
    if (chip.isNotEmpty && !chips.contains(chip)) {
      setState(() {
        chips.add(chip);
        _controller.clear();
      });
    }
  }
}