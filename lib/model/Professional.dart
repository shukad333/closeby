

import 'Profession.dart';

class Professional {

  int? id;
  String? name;
  List<Professions>? professions = [];
  String? image;
  int? rating;

  Professional({ this.id,  this.name,  this.professions,  this.image, this.rating});

  Professional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    print("Shu");
    if (json['professions'] != null) {
      professions = <Professions>[];
      json['professions'].forEach((v) {
        print("herexxx");
        print(v);
        professions!.add(new Professions.fromJson(v));
      });
    }
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.professions != null) {
      data['professions'] = this.professions!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }

}