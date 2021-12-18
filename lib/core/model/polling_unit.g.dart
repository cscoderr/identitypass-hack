// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polling_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollingUnit _$PollingUnitFromJson(Map<String, dynamic> json) => PollingUnit(
      gender: json['gender'] as String?,
      vin: json['vin'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      pollingUnit: json['polling_unit'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
    );

Map<String, dynamic> _$PollingUnitToJson(PollingUnit instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'vin': instance.vin,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'polling_unit': instance.pollingUnit,
      'date_of_birth': instance.dateOfBirth,
    };
