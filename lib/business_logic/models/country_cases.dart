
class Country_cases {
  String Country_Region;
  int Confirmed;
  int Deaths;
  int Recovered;
  int Active;
  var Lat;
  var Long_;

  Country_cases(
      {this.Country_Region,
      this.Confirmed,
      this.Deaths,
      this.Recovered,
      this.Active,
      this.Lat,
      this.Long_});

  factory Country_cases.fromJson(Map<String, dynamic> json){
    return Country_cases(
      Country_Region: json['Country_Region'],
      Confirmed: json['Confirmed'],
      Deaths: json['Deaths'],
      Recovered: json['Recovered'],
      Active: json['Active'],
      Lat: json['Lat'],
      Long_: json['Long_']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'Country_Region': this.Country_Region,
      'Confirmed': this.Confirmed,
      'Deaths': this.Deaths,
      'Recovered': this.Recovered,
      'Active': this.Active,
      'Lat': this.Lat,
      'Long_': this.Long_
    };
  }

}
