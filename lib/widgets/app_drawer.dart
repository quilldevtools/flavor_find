import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 80, // Reduced height
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Flavor Find',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.white),
            title: const Text('Recipes', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Implement recipes page navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.white),
            title: const Text('Planner', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Implement planner page navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.white),
            title: const Text('Shopping List', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Implement shopping list page navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Implement profile page navigation
            },
          ),
        ],
      ),
    );
  }
}
