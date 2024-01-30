import 'package:flutter/material.dart';

class searchbar extends StatefulWidget {
  const searchbar({super.key});

  @override
  State<searchbar> createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Color(0xFF04364A)),
        suffixIcon: IconButton(
          color: const Color(0xFF04364A),
          icon: const Icon(
            Icons.mic,
          ),
          onPressed: () {
            // Clear the search text
          },
        ),
        hintText: 'What are you looking for?',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
