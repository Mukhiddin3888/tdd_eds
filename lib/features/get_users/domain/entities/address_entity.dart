

import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable{

  final String street;

  final String suite;

  final String city;

  const AddressEntity({
    required this.street,
    required this.suite,
    required this.city
  });



  @override
  List<Object> get props => [street, suite, city];
}