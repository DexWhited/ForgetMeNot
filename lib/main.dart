import 'package:flutter/material.dart';
import 'newNote.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      //   useMaterial3: true,
      //   ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isDarkMode = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Color(0xff1ebd98),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.menu),
                  onSelected: (String value) {
                    if (value == 'darkmode') {
                      _toggleTheme();
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'darkmode',
                      child: Text(_isDarkMode ? 'Light Mode' : 'Dark Mode'),
                    ),
                    PopupMenuItem<String>(
                      value: 'settings',
                      child: Text('Settings'), // settings
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recent Notes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                    child: Center(child: Text('Entry ${entries[index]}')),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
              SizedBox(height: 20), // Add space below the ListView
              Text(
                'Folders',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              // Additional boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 90,
                    height: 90,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10), // Round corners
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewNotePage()),
            );
          },
          tooltip: 'New note',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, // Center the plus icon
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // these will eventually do things
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                onPressed: () {},
              ),
              SizedBox(),
              IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
