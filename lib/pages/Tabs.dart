import 'package:flutter/material.dart';

import 'favorites.dart';
import 'home.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        bottomNavigationBar: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.red,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.favorite)),
          ],
        ),
        body: TabBarView(
          children: [
            Home(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
