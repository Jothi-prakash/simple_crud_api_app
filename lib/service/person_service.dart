import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:simple_crud_api_app/model/person_details.dart';


//using a dio packages 
var dio = Dio();


// read a person details in a list of persons 
Future<List<Persondetails>> getPersonDetails() async {
  var response = await dio
      .get('https://crudcrud.com/api/3a360cfbd7d646c3a6f352aea6ce66b5/users');

  if (response.statusCode == 200) {
    var personJsons = response.data;
    var persons = <Persondetails>[];
    for (var personJson in personJsons) {
      var personObj = Persondetails.fromJson(personJson);
      persons.add(personObj);
    }
    return persons;
  }
  return <Persondetails>[];
}


//delete a person from the list 
Future<bool>deletePersonDetails(Persondetails personObj) async{
  var url=
  ('https://crudcrud.com/api/3a360cfbd7d646c3a6f352aea6ce66b5/users/${personObj.id}');
  var response=await dio.delete(url);
 if(response.statusCode==200)
 {
  return true;
 }
 return false;
}

//edit a person details from the persons list 
Future<bool> editPersonDetails(Persondetails personObj) async {
  dio.options.contentType = 'application/json';
  var url =
  ('https://crudcrud.com/api/3a360cfbd7d646c3a6f352aea6ce66b5/users/${personObj.id}');
  var response = await dio.put(url, data: jsonEncode(personObj.toJson()));
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

// add a person to the list 
Future<bool> addPersonDetails(Persondetails personObj) async {
  dio.options.contentType = 'application/json';
   var url=('https://crudcrud.com/api/3a360cfbd7d646c3a6f352aea6ce66b5/users');
  var response = await dio.post(url, data: jsonEncode(personObj.toJson()));
  if (response.statusCode == 201) {
    return true;
  }
  return false;
}
