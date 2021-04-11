import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Created by Ragul nathan.
/// ragulsarma@gmail.com
class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Text('Favourites')),
    );
  }
}
