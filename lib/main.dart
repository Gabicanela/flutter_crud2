import 'package:flutter/material.dart';
import 'package:flutter_crud2/provider/users.dart';
import 'package:flutter_crud2/routes/app_routes.dart';
import 'package:flutter_crud2/views/user_form.dart';
import 'package:flutter_crud2/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Users(),)],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 103, 58, 183)),
          useMaterial3: true,
        ),
        home: const UserList(),
        routes: {
          AppRoutes.HOME:(context) => const UserList(),
          AppRoutes.USER_FORM: (_) => const UserForm(),
        }
      ),
    );
  }
}
