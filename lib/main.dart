import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class FavroiteIcon extends StatefulWidget {
  const FavroiteIcon({super.key});

  @override
  State<FavroiteIcon> createState() => _FavroiteIconState();
}

class _FavroiteIconState extends State<FavroiteIcon> {
  bool _isFavorited = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      icon: (_isFavorited
          ? const Icon(Icons.favorite)
          : const Icon(
              Icons.favorite,
              color: Colors.red,
            )),
      onPressed: () {
        setState(() {
          if (_isFavorited) {
            _isFavorited = false;
          } else {
            _isFavorited = true;
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: (Color.fromRGBO(0, 0, 0, 0.6)));
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Copyright 2022 SODA  All rights reserved.',
      style: optionStyle,
    ),
    Text(
      'Copyright 2022 SODA  All rights reserved.',
      style: optionStyle,
    ),
    Text(
      'Copyright 2022 SODA  All rights reserved.',
      style: optionStyle,
    ),
    Text(
      'Copyright 2022 SODA  All rights reserved.',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SODA'),
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff182949),
          ),
          child: Text(
            'SODA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        ListTile(
          leading: FavroiteIcon(),
          title: Text("Icon: favorite"),
        )
      ])),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff4B6EB1),
        onTap: _onItemTapped,
      ),
    );
  }
}
