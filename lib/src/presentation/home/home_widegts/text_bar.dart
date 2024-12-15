import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const TextBar({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          Container(
            height: 54,
            width: 88,
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(31.0),
                bottomRight: Radius.circular(31.0),
              ),
            ),
            child: TextButton(
              onPressed: () {
                final cityName = controller.text.trim();
                if (cityName.isNotEmpty) {
                  onSearch(cityName);
                } else {
                  print("City name cannot be empty.");
                }
              },
              child: Text(
                'Search',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color:
                        Theme.of(context).colorScheme.onPrimary), // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
