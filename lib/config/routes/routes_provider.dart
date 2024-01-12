import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/config.dart';

final routesProvider = Provider<GoRouter>((ref) => GoRouter(
      initialLocation: RoutesLocation.home,
      routes: appRoutes,
    ));
