import 'package:flutter/material.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text("Item 1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Item 2"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
