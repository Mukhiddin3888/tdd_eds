

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'address_entity.g.dart';

@HiveType(typeId: 3)
class AddressEntity extends Equatable{

  @HiveField(0)
  final String street;

  @HiveField(1)
  final String suite;

  @HiveField(2)
  final String city;

  const AddressEntity({
    required this.street,
    required this.suite,
    required this.city
  });



  @override
  List<Object> get props => [street, suite, city];
}