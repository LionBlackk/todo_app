import 'package:go_router/go_router.dart';
import 'package:todo_app/config/config.dart';
import 'package:todo_app/screens/screen.dart';

final appRoutes = [
  GoRoute(
    path: RoutesLocation.home,
    builder: HomeScreen.builder,
  ),
  GoRoute(path: RoutesLocation.createTask, builder: CreateTaskScreen.builder),
];
