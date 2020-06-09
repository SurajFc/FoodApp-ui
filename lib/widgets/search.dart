import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 0.8,
            color: Theme.of(context).primaryColor,
          ),
        ),
        hintText: 'Search Food & Restaurant',
        prefixIcon: Icon(
          Icons.search,
          size: 30.0,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {},
        ),
      ),
    );
  }
}
