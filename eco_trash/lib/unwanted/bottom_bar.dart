import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: isElevated ? null : 0.0,
        child: Row(
          children: <Widget>[
            // IconButton(
            //   tooltip: 'Open popup menu',
            //   icon: const Icon(Icons.more_vert),
            //   onPressed: () {
            //     final SnackBar snackBar = SnackBar(
            //       content: const Text('Yay! A SnackBar!'),
            //       action: SnackBarAction(
            //         label: 'Undo',
            //         onPressed: () {},
            //       ),
            //     );

            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   },
            // ),
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
