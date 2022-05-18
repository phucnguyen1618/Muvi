import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(String title) {
  return AppBar(
    centerTitle: false,
    backgroundColor: Colors.black87,
    leadingWidth: 32.0,
    leading: const CircleAvatar(
      child: Text(
        'P',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    ),
    title: Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    ],
  );
}
