import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/pages/settings_page.dart';
import 'package:todo_list/pages/home_page.dart';
import 'package:todo_list/store/subtask.dart';
import 'package:todo_list/store/todo.dart';
import 'package:todo_list/store/todos.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(SubtaskAdapter());
  var app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Todos _todos = Todos();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<Todos>(create: (context) => _todos,),
      ],
      child: 
        MaterialApp(
          theme: ThemeData.dark(),
          initialRoute: '/',
          routes: {
            '/': (_) => const HomePage(),
            '/settings': (_) => const SettingsPage()
          },
        )
    );
  }
}

