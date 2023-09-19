import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController searchController,
    required this.searchFunction,
    this.hintText,
    this.width,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final String? hintText;
  final double? width;
  final void Function(String) searchFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 200.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.only(left: 10.0),
      child: TextField(
        controller: _searchController,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onChanged: searchFunction,
      ),
    );
  }
}
