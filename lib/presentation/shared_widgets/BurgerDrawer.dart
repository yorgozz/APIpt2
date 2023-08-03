import 'package:flutter/material.dart';

class Burger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF3C4955),
            ),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
            child: ListTile(
              title: Text(
                'Sign In',
                style: TextStyle(
                  color: Color.fromARGB(187, 42, 41, 41),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/signin');
              },
            ),
          ),
          SizedBox(height: 5),
          Container(
            color: Color.fromARGB(255, 255, 252, 252),
            child: ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Color.fromARGB(255, 119, 116, 116),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
