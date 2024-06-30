import 'package:federation/router.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero).then((_) {
    //   ModelSettings activityList = Provider.of<ModelSettings>(context, listen: false);
    
    //   activityList.loadActivities();
    // });
    return MaterialApp.router(
      title: 'app with routing',
      routerConfig: router,
    );
  }

  // final GoRouter _router = GoRouter(
  // routes: <RouteBase>[
  //   GoRoute(path: '/',builder: ((context, state) => const ActivityOptions())),
  //   GoRoute(path: '/welcome',builder: ((context, state) => const Welcome())),
  //   GoRoute(path: '/activity_options',builder: ((context, state) => const ActivityOptions())),
  // ]);
}

