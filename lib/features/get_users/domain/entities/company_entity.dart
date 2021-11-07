

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'company_entity.g.dart';

@HiveType(typeId: 4)
class CompanyEntity extends Equatable{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String bs;



  const CompanyEntity({
    required this.name,
    required this.bs,

  });



  @override
  List<Object> get props => [name, bs];
}