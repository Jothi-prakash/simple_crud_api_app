//class of person details 
class Persondetails
{
  String? name;
  int? age;
  String? id;

  Persondetails({
    this.name,
    this.age,
    this.id
  });

//from json 
  Persondetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    id=json['_id'];
  }

//to json 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['_id']=id;
    return data;
  }
}