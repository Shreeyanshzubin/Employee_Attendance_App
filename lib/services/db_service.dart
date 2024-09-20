import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:employee_attendance_app/constants/constants.dart';

class Dbservice extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  // UserModel? userModel;

  String generateRandomEmployeeId(){
    final random = Random();
    const allChars = "faangFAANG0123456789";
    final randomString = List.generate(8, (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;
  }

  Future insertNewUser(String email, var id) async{
    await _supabase.from(Constants.employeeTable).insert({
      'id':id,
      'name':'',
      'email':email,
      'employee_Id': generateRandomEmployeeId(),
      'department':null,
    });
  }
  // Future<UserModel> getUserData()async{
  //   final userdata = await _supabase.from(Constants.employeeTable).select().eq('id', _supabase.auth.currentUser!.id).single();
  //   userModel = UserModel.fromJson(userData);
  //   return userModel!;
  // }
}