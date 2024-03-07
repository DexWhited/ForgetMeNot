import 'package:flutter/material.dart';
import 'newNote.dart';
import 'profile.dart';
import 'contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
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
  TextEditingController _textController1 = TextEditingController();
  TextEditingController _textController2 = TextEditingController();

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
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: const Color(0xff1ebd98),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
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
                      child: const Text('Settings'), // settings
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
              const Text(
                'Recent Notes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewNotePage(
                            textController: index == 0
                                ? _textController1
                                : _textController2,
                          ),
                        ),
                      );

                      // If result is not null, update text controller with the result
                      if (result != null) {
                        setState(() {
                          if (index == 0) {
                            _textController1.text = result;
                          } else {
                            _textController2.text = result;
                          }
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            BorderRadius.circular(10), // Round corners
                      ),
                      child: Center(
                        child: Text(
                          index == 0
                              ? _textController1.text
                              : _textController2.text,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
              SizedBox(height: 20),
              const Text(
                'Folders',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    width: 90,
                    height: 90,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
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
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewNotePage(
                  textController: _textController2,
                ),
              ),
            );

            if (result != null) {
              setState(() {
                _textController2.text = result;
              });
            }
          },
          tooltip: 'New note',
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, // Center the plus icon
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // these will eventually do things
                },
              ),
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {},
              ),
              const SizedBox(),
              IconButton(
                icon: const Icon(Icons.account_circle),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactDetailsPage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
