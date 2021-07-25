import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Hero(
          tag: 'title',
          child: Text(
            'Sabka Kirana',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      );
}
