import 'package:federation/screens/home.dart';
import 'package:federation/screens/news/news.dart';
import 'package:federation/screens/news/news_inner.dart';
import 'package:federation/screens/persons/persons.dart';
import 'package:federation/screens/persons/persons_inner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Home(navigationShell: navigationShell);        
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const News(),
              routes: [
                GoRoute(
                path: 'news_inner/:id',
                builder: ((context,state) => NewsInner(
                  state.pathParameters['id'].toString()))
                ),                 
              ]
            ),                 
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/persons',
              builder: (context, state){
                // final String title = state.pathParameters['id'].toString();
                return Persons();
              },
              routes: [
              GoRoute(
                path: 'person_inner/:id',
                builder: (context, state) => PersonInner(state.pathParameters['id'].toString())
              )
              ]
            )            
          ]
        )        
      ]
    ),
    // GoRoute(path: '/welcome',builder: ((context, state) => const Welcome())),
    // GoRoute(path: '/activity_options',builder: ((context, state) => const ActivityOptions())),
  ]);