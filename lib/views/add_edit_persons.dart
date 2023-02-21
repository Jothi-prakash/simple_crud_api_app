import 'package:flutter/material.dart';

import '../model/person_details.dart';

// create a statefulwidget 
class AddEditPerson extends StatefulWidget {
  const AddEditPerson({Key? key, this.person}) : super(key: key);
  final Persondetails? person;

  @override
  AddEditPersonState createState() => AddEditPersonState();
}

class AddEditPersonState extends State<AddEditPerson> {
  //create a controler for getting a input from users 
  final formkey = GlobalKey<FormState>();
  TextEditingController nameControler = TextEditingController();
  TextEditingController ageControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.person != null) {
      nameControler.text = widget.person!.name!;
      //age is an int so we can convert into string 
      ageControler.text = widget.person!.age.toString();
    }
  }

  // validate a number is empty or not 
  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number ';
    }

    var valueOfAge = int.parse(value);
    if (valueOfAge < 0 || valueOfAge > 100) {
      return 'Please enter valid number';
    }
    return null;
  }
 
 // build method 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            getStausTitle(),
            getPersonName(),
            getPersonAge(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        var nameText = nameControler.text;
                        var ageNumber = int.parse(ageControler.text);

                        var personObj = Persondetails(
                          name: nameText,
                          age: ageNumber,
                        );
                        if (widget.person != null) {
                          personObj.id = widget.person!.id;
                        }

                        Navigator.pop(context, personObj);
                      },
                      child: const Text('Ok')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],
              ),
            )
          ]),
    );
  }

//get a age input from user 
  TextFormField getPersonAge() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: validateNumber,
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          labelText: 'Enter Person Age',
          hintText: 'Person Age'),
      controller: ageControler,
    );
  }

// get a input of user name 
  TextFormField getPersonName() {
    return TextFormField(
      keyboardType: TextInputType.name,
      validator: validateNumber,
      decoration: const InputDecoration(
          icon: Icon(Icons.subject_outlined),
          labelText: 'Enter name',
          hintText: 'Name'),
      controller: nameControler,
    );
  }
 // give a show status of Add or Edit boxes in user interface 
  getStausTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Text(
                  widget.person == null ? 'Add' : 'Edit',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )),
              )),
        ),
      ],
    );
  }
}