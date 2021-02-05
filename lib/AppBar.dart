import 'package:flutter/material.dart';
import 'colors.dart';

class MyAppBar extends AppBar {
  MyAppBar()
      : super(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "SomeWhere",
                style: TextStyle(
                  color: voilet,
                  fontFamily: "GreatVibes",
                ),
              ),
            ),
          ),
          backgroundColor: yellow,
          leadingWidth: 30,
          elevation: 0,
        );
}
