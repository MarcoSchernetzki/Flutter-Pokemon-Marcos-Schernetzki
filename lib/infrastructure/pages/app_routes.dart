import 'package:flutter/material.dart';
import 'package:pokeapi/features/favorite/favorite_page.dart';
import 'package:pokeapi/features/home/home_page.dart';
import 'package:sidebarx/sidebarx.dart';

class AppRoutes extends StatelessWidget {
  final SidebarXController _controller;
  final Function handlerMenu;

  const AppRoutes(
      {Key? key,
      required SidebarXController controller,
      required this.handlerMenu})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          switch (_controller.selectedIndex) {
            case 0:
              handlerMenu();
              return const HomePage();
            case 1:
              handlerMenu();
              return FavoritePage();
            default:
              return const HomePage();
          }
        });
  }
}
