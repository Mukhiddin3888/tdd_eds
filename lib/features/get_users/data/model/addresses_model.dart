


import 'package:tdd_eds/features/get_users/domain/entities/address_entity.dart';

class AddressModel extends AddressEntity{


 const AddressModel({
    required String street,
    required  String suite,
    required String city
  }) : super( street: street, city: city, suite: suite);


  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
    );
  }


}