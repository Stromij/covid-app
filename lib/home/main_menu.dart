import 'package:covid_hub/cognito/cognito.dart';
import 'package:covid_hub/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key key}) : super(key: key);

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
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage())),
                child: CircleAvatar(
                  child: Text(
                    user.name.substring(0, 1),
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Mein Profil'),
              trailing: Icon(Icons.account_circle),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage())),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: ListView(
          children: <Widget>[
            Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 15),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Achtung',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.warning,
                                  color: Colors.redAccent,
                                  size: 30,
                                ))
                          ],
                        ),
                        Text(
                          'Kontakt 5. Grades \nan Covid-19 erkrankt',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 23,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'mehr...',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                top: 10,
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Du hast dich krank gemeldet',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    'Führe ein Symptomtagebuch, um den Verlauf für  dich und andere nachvollziehbar aufzuzeichnen',
                    softWrap: true,
                    style: TextStyle(fontSize: 20, color: Colors.redAccent),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text(
                        'Symptomtagebuch',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                top: 10,
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Deine Kontakte',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: 'btn1',
                            onPressed: () {},
                            child: Icon(Icons.add),
                            mini: true,
                            backgroundColor: Colors.green,
                          )
                        ],
                      ),
                      Text(
                        '71',
                        style: TextStyle(fontSize: 45),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Bis zum 1. Grad',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      Text(
                        '98710',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'enge Kontakte',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '4',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Maria Schumann',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Zuletzt vor 1 Tag getroffen',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'Treffen hinzufügen',
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Olaf Kastenbaum',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'Zuletzt vor 17 Tagen gtr.',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'Treffen hinzufügen',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Container(
                color: Colors.white,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn2',
                          onPressed: null,
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Text(
                          'Neues Treffen hinzufügen',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn3',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Maria Schumann, Axel Bauer',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 2 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Ort noch nachtragen',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn4',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Olaf Kastenbaum',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 20 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Universität Deutschland Gebäude',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn5',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Olaf Kastenbaum',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 20 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Universität Deutschland Gebäude',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn6',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Olaf Kastenbaum',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 20 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Universität Deutschland Gebäude',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn7',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Olaf Kastenbaum',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 20 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Universität Deutschland Gebäude',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      children: <Widget>[
                        FloatingActionButton(
                          heroTag: 'btn8',
                          onPressed: null,
                          backgroundColor: Colors.greenAccent,
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Olaf Kastenbaum',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'vor 20 Tagen',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Universität Deutschland Gebäude',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              )
                            ]),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ));
}
