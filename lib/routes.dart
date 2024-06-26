import 'package:flutter/cupertino.dart';
import 'package:flutter_study/page/add_history_page.dart';
import 'package:flutter_study/page/add_plan_page.dart';
import 'package:flutter_study/page/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'plan/:id/addHistory',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(
            child: AddHistoryPage(
              planId: int.parse(state.pathParameters['id']!),
            ),
          ),
        ),
        GoRoute(
          path: 'addPlan',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              const CupertinoPage(
            child: AddPlanPage(),
          ),
        ),
      ],
    ),
  ],
);
