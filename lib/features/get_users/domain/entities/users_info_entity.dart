


import 'package:equatable/equatable.dart';
import 'package:tdd_eds/features/get_users/domain/entities/address_entity.dart';
import 'package:tdd_eds/features/get_users/domain/entities/company_entity.dart';

class UsersEntity extends Equatable{


  final int id;

  final String name;

  final String userName;

  final String email;

  final String phone;

  final AddressEntity address;

  final String website;

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