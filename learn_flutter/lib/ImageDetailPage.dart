// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HYImageDetailPage extends StatelessWidget {
  final String _imageURL;

  HYImageDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(tag: _imageURL, child: Image.network(_imageURL))),
      ),
    );
  }
}
