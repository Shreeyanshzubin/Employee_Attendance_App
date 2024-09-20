
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final String department;
  final String emplyoeeId;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.department,
    required this.emplyoeeId,
});
  factory UserModel.fromJson(Map<String,dynamic> data){
    return UserModel(
      id: data['id'],
        email: data['email'],
        name: data['name'],
        department: data['department'],
        emplyoeeId: data['employeeId'],
    );
  }
}