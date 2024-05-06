import 'package:flutter/material.dart';
import 'package:p_peliculas_app/presentation/views/views.dart';
import 'package:p_peliculas_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[HomeView(), Placeholder(), FavoritesView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
        body: IndexedStack(
          index: pageIndex,
          children: viewRoutes,
        ));
  }
}
