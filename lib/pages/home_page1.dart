import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/video_hero.dart';
import 'package:flutter_application_1/pages/regions_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('France Data'),
                  Text('Atlas de Données Françaises'),
                ],
              ),
            ),
            ListTile(
              title: const Text('Accueil'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Régions'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegionPage(title: 'Recherche par régions'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Paramètres'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          const VideoHero(),
          SvgPicture.asset(
            'web/assets/img/france.svg',
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.blue,
            height: 50,
            child: const Center(
              child: Text("I. Nos Régions", style: TextStyle(color: Colors.white)),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(loremIpsum(words: 60)),
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegionPage(title: 'Recherche par régions'),
                    ),
                  );
                },
                child: const Text(
                  'Rechercher par région',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
