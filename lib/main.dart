import 'package:bloc_api/src/repository/post_repository.dart';
import 'package:bloc_api/src/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Post App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: RepositoryProvider(
        create: (context) => PostRepository(),
        child: const MyHomePage(),
      ),
    );
  }
}
