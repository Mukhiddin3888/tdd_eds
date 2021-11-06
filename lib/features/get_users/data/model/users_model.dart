


import 'package:tdd_eds/features/get_users/data/model/addresses_model.dart';
import 'package:tdd_eds/features/get_users/data/model/company_model.dart';
import 'package:tdd_eds/features/get_users/domain/entities/users_info_entity.dart';

class UsersModel extends UsersEntity{


  const UsersModel(
      {
        required int id,
        required String name,
        required String userName,
        required String phone,
        required String email,
        required AddressModel address,
        required String website,
        required CompanyModel company
      }) : super(id: id, name: name, address: address, company: company, email: email, phone: phone, userName: userName, website: website);

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id:json['id'],
      name: json['name'],
      userName: json['username'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      address: AddressModel.fromJson(json['address']  as Map<String, dynamic> ),
      company: CompanyModel.fromJson(json['company'] as Map<String, dynamic>  ),

    );
  }
}