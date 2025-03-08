import 'package:app/main_page.dart';
import 'package:app/models/book.dart';
import 'package:app/modules/book_details/book_details_page.dart';
import 'package:app/modules/books/books_page.dart';
import 'package:app/modules/user_edit/user_edit_page.dart';
import 'package:app/modules/user_info/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  factory AppRouter() => _instance;

  /// Ensure to make this as a singleton class.
  AppRouter._() {
    _initialize();
  }

  static final AppRouter _instance = AppRouter._();
  static AppRouter get i => _instance;

  static late final GoRouter router;

  void _initialize() {
    router = GoRouter(
      initialLocation: BooksPage.route,
      routes: <RouteBase>[
        ShellRoute(
          builder: (_, GoRouterState state, Widget child) {
            return MainPage(
              key: const ValueKey<String>('main-screen'),
              title: state.topRoute?.name ?? '',
              child: child,
            );
          },
          routes: <RouteBase>[
            GoRoute(
              path: BooksPage.route,
              name: 'Books',
              builder: (_, __) => const BooksPage(), //
            ),
            GoRoute(
              path: UserEditPage.route,
              name: 'User Edit',
              builder: (_, __) => const UserEditPage(),
            ),
            GoRoute(
              path: UserInfoPage.route,
              name: 'User Info',
              builder: (_, __) => const UserInfoPage(),
            ),
          ],
        ),
        GoRoute(
          path: BookDetailsPage.route,
          name: 'Book Details',
          builder: (_, GoRouterState state) => BookDetailsPage(state.extra as Book),
        ),
      ],
    );
  }
}
