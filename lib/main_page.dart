import 'package:app/modules/books/books_page.dart';
import 'package:app/modules/user_edit/user_edit_page.dart';
import 'package:app/modules/user_info/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({required this.child, required this.title, super.key});

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(title)),
      body: child,
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Prix Technical Test', style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text('Books'),
                leading: const Icon(Icons.book),
                onTap: () {
                  context.pop();
                  context.go(BooksPage.route);
                },
              ),
              ListTile(
                title: const Text('User Edit'),
                leading: const Icon(Icons.edit),
                onTap: () {
                  context.pop();
                  context.go(UserEditPage.route);
                },
              ),
              ListTile(
                title: const Text('User Info'),
                leading: const Icon(Icons.person),
                onTap: () {
                  context.pop();
                  context.go(UserInfoPage.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
