import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int count = 0;

  @override
  void initState() {
    // TODO: fetch data from Firebase
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Flutter is Fun!'),
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School'
            ),
          ],
        ),

        drawer: const Drawer(
          child: Text('Yo!'),
        ),

        body: ListView.builder(
          addAutomaticKeepAlives: false,
          itemBuilder: (_, index) {
            return Container(
              color: randomColor(),
              width: 1000,
              height: 500,
              child: Center(
                child: Text(
                  '$count',
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
