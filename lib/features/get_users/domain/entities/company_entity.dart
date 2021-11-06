

import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable{

  final String name;

  final String bs;



  const CompanyEntity({
    required this.name,
    required this.bs,

  });



  @override
  List<Object> get props => [name, bs];
}