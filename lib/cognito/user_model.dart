import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';


part 'user_model.g.dart';

part 'user_enums.dart';

@immutable
@CopyWith()
class User {
  final String email;
  final String passwd;
  final String location;
  final Set<Conditions> conditions;
  final int birthYear;
  final CovidStatus status;
  final String name;
  final AgeGroup ageGroup;

  final int numContacts;
  final int totalInfectedContacts;
  final int infectedContacts;
  final int numCloseContacts;
  final int infectedCloseContacts;

  User({
    @required this.email,
    @required this.passwd,
    this.location,
    this.conditions,
    this.birthYear,
    this.status,
    this.name,
    this.numContacts,
    this.totalInfectedContacts,
    this.infectedContacts,
    this.numCloseContacts,
    this.infectedCloseContacts,
  }) : ageGroup = _parseAge(birthYear);

  List<AttributeArg> get userAttributes => <AttributeArg>[
        //AttributeArg(name: 'name',value: name),
        AttributeArg(name: 'location', value: location),
        AttributeArg(name: 'age', value: birthYear.toString()),
        AttributeArg(name: 'MedicalConditions', value: conditions.toString()),
        AttributeArg(name: 'AgeGroup', value: ageGroup.index.toString())
      ];

  static AgeGroup _parseAge(int year) {
    int age = DateTime.now().year - DateTime(year).year;
    if (age <= 12) {
      return AgeGroup.CHILD;
    } else if (13 <= age && age <= 19) {
      return AgeGroup.TEENAGER;
    } else if (20 <= age && age <= 29) {
      return AgeGroup.YOUNG_ADULT_TWENTIES;
    } else if (30 <= age && age <= 39) {
      return AgeGroup.YOUNG_ADULT_THIRTIES;
    } else if (40 <= age && age <= 49) {
      return AgeGroup.MIDDLE_AGED_FOURTIES;
    } else if (50 <= age && age <= 59) {
      return AgeGroup.MIDDLE_AGED_FIFTIES;
    } else {
      return AgeGroup.SENIOR;
    }
  }
}
