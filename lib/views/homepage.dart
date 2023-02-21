//create a homepage for debug
import 'package:flutter/material.dart';
import 'package:simple_crud_api_app/service/person_service.dart';
import 'package:simple_crud_api_app/views/person_widget.dart';

import '../model/person_details.dart';
import 'add_edit_persons.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  //showing a dialogue box for adding a person details by user 
  Future<Persondetails?> showPersonAddEditDialog(Persondetails? person) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: AddEditPerson(person: person),
        );
      },
    );
  }
// showing a delete option whether the user can delete the person or not 
  Future<bool?> showDeleteOption() async {
    return await showDialog<bool?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm:'),
            content: const Text("Are you sure you want to delete the person "),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("No"),
              )
            ],
          );
        });
  }

    // create a seperate widget for an body that return a widget 
    Widget getBody() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return getPersonWidget(data!);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: getPersonDetails(),
    );
  }

// whether the user known the list is empty or not 
  Widget getPersonWidget(List<Persondetails> data) {
    if (data.isEmpty) {
      return const Center(child: Text('There is no data in the list '));
    }
      return ListView(children: getPersonWidgets(data));
  }

// this function defines ontap to show a edit dialogue box then on double tapthat time shows a delete option  
List<Widget> getPersonWidgets(List<Persondetails> persons) {
        persons.map((e) => 
        GestureDetector(
        onLongPress: () async {
          var canDelete = await showDeleteOption();
          if (canDelete!) {
            await deletePersonDetails(e);
            setState(() {});
          }
        },
        onTap: () async {
          var newPerson = await showPersonAddEditDialog(e);
          if (newPerson != null) {
            await editPersonDetails(newPerson);
            setState(() {});
          }
        },
        child: PersonWidget(person: e),
      )).toList();
       return <Widget>[]; 
    }
  

// create a build method 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud App'),
      ),
      body: getBody(),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add),onPressed: () async {
          var person = await showPersonAddEditDialog(null);
          if (person != null) {
            await addPersonDetails(person);
            setState(() {});
          }}));
  }
}