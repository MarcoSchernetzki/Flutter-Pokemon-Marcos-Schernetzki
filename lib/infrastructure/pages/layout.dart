import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../bloc/user/model/user.dart';
import '../../bloc/user/user_bloc.dart';
import 'app_routes.dart';
import 'footer.dart';
import 'menu.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});
  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  void handlerMenu() {
    _key.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          toolbarHeight: 90,
          title: const Center(
            child: Text('Poke Api'),
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  final newUser = User('Marcos', 'marcos@gmail.com');
                  BlocProvider.of<UserBloc>(context, listen: false)
                      .add(ActivateUser(newUser));
                })
          ],
        ),
        drawer: Menu(controller: _controller),
        body: Center(
            child:
                AppRoutes(controller: _controller, handlerMenu: handlerMenu)),
        bottomNavigationBar: const Footer());
  }
}
