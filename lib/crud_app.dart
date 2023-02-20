import 'package:flutter/material.dart';
import 'package:simple_crud_api_app/views/homepage.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //create a material app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' CRUD API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:const  Homepage(),
    );
  }
}
