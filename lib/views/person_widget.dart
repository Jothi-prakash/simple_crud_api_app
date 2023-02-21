
import 'package:flutter/material.dart';

import '../model/person_details.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key, this.person}) : super(key: key);
  final Persondetails? person;

  @override
  Widget build(BuildContext context) {
    // create a list tile thats shows on a persondetails in display of a scaffold page  
    return ListTile(
        title: Text('Name:${person!.name!}'),
        subtitle: Text('Age:${person!.age!.toString()}'));
  }
}