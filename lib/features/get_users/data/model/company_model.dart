import 'package:tdd_eds/features/get_users/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity{



  const CompanyModel({
    required String name,
    required String bs,

  }) : super(name: name, bs: bs);

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        name: json["name"],
        bs: json["bs"]
    );
  }


}