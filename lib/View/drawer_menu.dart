

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF161A30),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 80, // Largeur maximale pour le logo
                    maxHeight: 80, // Hauteur maximale pour le logo
                  ),
                  child: Image.asset("assets/images/logo.jpg"),
                ),
                SizedBox(width: appPadding), // Espace entre l'image et le texte
                Text(
                  'Ecoshop', // Remplacez avec le texte que vous voulez
                  style: TextStyle(
                    // Ajoutez votre style de texte ici
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: grey,
                  ),
                ),
              ],
            ),

          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                Navigator.of(context).pushReplacementNamed('/dashboard');
              }),
          DrawerListTile(
              title: 'Commentaires',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                Navigator.of(context).pushReplacementNamed('/post');
              }),
          DrawerListTile(
              title: 'Rates', svgSrc: 'assets/icons/Message.svg', tap: () {
            Navigator.of(context).pushReplacementNamed('/scan');
          }),
          DrawerListTile(
              title: 'Historique',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {
                Navigator.of(context).pushReplacementNamed('/history');
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),

          DrawerListTile(
              title: 'Profile',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {
                Navigator.of(context).pushReplacementNamed('/profile');
              }),
          DrawerListTile(
              title: 'Logout',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {}),
        ],
      ),
    );
  }
}
