


class Professions {
  int? id;
  String? professionType;
  double? ratePerHour;
  double? ratePerDay;
  bool? active;
  bool? hourly;

  Professions(
      { this.id,
         this.professionType,
         this.ratePerHour,
         this.ratePerDay,
         this.active,
         this.hourly});

   Professions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    professionType = json['professionType'];
    ratePerHour = json['ratePerHour'];
    ratePerDay = json['ratePerDay'];
    active = json['active'];
    hourly = json['hourly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['professionType'] = this.professionType;
    data['ratePerHour'] = this.ratePerHour;
    data['ratePerDay'] = this.ratePerDay;
    data['active'] = this.active;
    data['hourly'] = this.hourly;
    return data;
  }
}