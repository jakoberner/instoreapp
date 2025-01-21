import 'package:instoreapp/models/company_branch_model.dart';

class CompanyModel {
  final int code;
  final String name;
  final List<CompanyBranchModel> branchNames;
  const CompanyModel({required this.code, required this.name, required this.branchNames});
}
