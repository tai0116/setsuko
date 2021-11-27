import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  int _selectedIndex = 0;

  static final _rootScreenItems = RootScreenItem.initItems;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: _rootScreenItems.elementAt(_selectedIndex).appBar,
      body: _rootScreenItems.elementAt(_selectedIndex).body,
      bottomNavigationBar: BottomNavigationBar(
        items: _rootScreenItems.map((e) => e.bottomNavigationBarItem).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class RootScreenItem {
  const RootScreenItem({
    required this.appBar,
    required this.body,
    required this.bottomNavigationBarItem,
  });

  RootScreenItem.fromCategory(RootScreenCategory category)
      : appBar = category.appBar,
        body = category.body,
        bottomNavigationBarItem = category.bottomNavigationBarItem;

  final PreferredSizeWidget appBar;
  final Widget body;
  final BottomNavigationBarItem bottomNavigationBarItem;

  static List<RootScreenItem> get initItems {
    return <RootScreenItem>[
      for (final category in RootScreenCategory.values)
        RootScreenItem.fromCategory(category),
    ];
  }
}

enum RootScreenCategory {
  home,
  message,
  favorite,
}

extension on RootScreenCategory {
  PreferredSizeWidget get appBar {
    switch (this) {
      case RootScreenCategory.home:
        return AppBar();
      case RootScreenCategory.message:
        return AppBar(leading: const EmptyLeading());
      case RootScreenCategory.favorite:
        return AppBar(leading: const EmptyLeading());
    }
  }

  Widget get body {
    switch (this) {
      case RootScreenCategory.home:
        return const Home();
      case RootScreenCategory.message:
        return const Message();
      case RootScreenCategory.favorite:
        return const Favorite();
    }
  }

  BottomNavigationBarItem get bottomNavigationBarItem {
    switch (this) {
      case RootScreenCategory.home:
        return const BottomNavigationBarItem(
          label: 'home',
          icon: Icon(Icons.home),
        );
      case RootScreenCategory.message:
        return const BottomNavigationBarItem(
          label: 'message',
          icon: Icon(Icons.message),
        );
      case RootScreenCategory.favorite:
        return const BottomNavigationBarItem(
          label: 'favorite',
          icon: Icon(Icons.favorite),
        );
    }
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class EmptyLeading extends StatelessWidget {
  const EmptyLeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
