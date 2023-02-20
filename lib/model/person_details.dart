//class of person details 
class Persondetails
{
  String? name;
  int? age;

  Persondetails({
    this.name,
    this.age,
  });

//from json 
  Persondetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

//to json 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}