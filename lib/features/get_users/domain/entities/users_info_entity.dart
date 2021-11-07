


import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:tdd_eds/features/get_users/domain/entities/address_entity.dart';
import 'package:tdd_eds/features/get_users/domain/entities/company_entity.dart';

part 'users_info_entity.g.dart';

@HiveType(typeId: 5)
class UsersEntity extends Equatable{


  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String userName;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final AddressEntity address;

  @HiveField(6)
  final String website;

  @HiveField(7)
  final CompanyEntity company;

  const UsersEntity(
      {
        required this.id,
        required this.name,
        required this.userName,
        required this.phone,
        required this.email,
        required this.address,
        required this.website,
        required this.company
      });

  @override
  List<Object> get props => [id, name, userName, phone, email, address, website, company];

}