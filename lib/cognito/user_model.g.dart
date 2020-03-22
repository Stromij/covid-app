// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

// ignore_for_file: argument_type_not_assignable, implicit_dynamic_type, always_specify_types

extension UserCopyWithExtension on User {
  User copyWith({
    int birthYear,
    List conditions,
    String email,
    int infectedCloseContacts,
    int infectedContacts,
    String location,
    String name,
    int numCloseContacts,
    int numContacts,
    String passwd,
    CovidStatus status,
    int totalInfectedContacts,
  }) {
    return User(
      birthYear: birthYear ?? this.birthYear,
      conditions: conditions ?? this.conditions,
      email: email ?? this.email,
      infectedCloseContacts:
          infectedCloseContacts ?? this.infectedCloseContacts,
      infectedContacts: infectedContacts ?? this.infectedContacts,
      location: location ?? this.location,
      name: name ?? this.name,
      numCloseContacts: numCloseContacts ?? this.numCloseContacts,
      numContacts: numContacts ?? this.numContacts,
      passwd: passwd ?? this.passwd,
      status: status ?? this.status,
      totalInfectedContacts:
          totalInfectedContacts ?? this.totalInfectedContacts,
    );
  }
}
