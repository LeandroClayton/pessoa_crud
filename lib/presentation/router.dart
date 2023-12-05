

import 'package:go_router/go_router.dart';

import 'package:pessoa_crud/presentation/view/home.dart';

final router = GoRouter(
  initialLocation: "/peoples",
  routes: [
  GoRoute(
    path: "/peoples",
    builder:(context, state) => const Home(),
    ),
]);