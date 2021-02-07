import 'package:covid_tracker/business_logic/models/country_cases.dart';

class Attributes{
  Country_cases attr;

  Attributes({this.attr});

  factory Attributes.fromJson(Map<String, dynamic> json){
    return Attributes(attr: Country_cases.fromJson(json['attributes']));
  }

  Map<String, dynamic> toJson(){
    return {
      'attributes': attr.toJson()
    };
  }

  @override
  String toString() {
    return 'Attributes: ${attr.Country_Region} , ${attr.Active}';
  }

}