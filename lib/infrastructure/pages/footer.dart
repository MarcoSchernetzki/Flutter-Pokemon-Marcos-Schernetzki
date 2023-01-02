import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.keyboard_arrow_right),
        ),
      ],
    ));
  }
}
