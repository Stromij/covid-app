import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Hauptmenü'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Max Muster'),
                accountEmail: Text('muster@covidhub.info'),
                currentAccountPicture: GestureDetector(
                  onTap: null, // TODO navigate to propfile Page
                  child: CircleAvatar(
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text('Mein Profil'),
                trailing: Icon(Icons.account_circle),
                onTap: null, //TODO navigate to profile Page
              ),
            ],
          ),
        ),
        body: Column(),
      );
}
