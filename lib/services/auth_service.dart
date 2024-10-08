import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/utils.dart';
import 'db_service.dart';

class AuthService extends ChangeNotifier{
  final SupabaseClient _supabase = Supabase.instance.client;
  final Dbservice _dbservice = Dbservice();

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future registerEmployee(String email,String password,BuildContext context)async{
    try {
      setIsLoading = true;
      if(email == "" || password == ""){
        throw ("All Fields are required");
      }
      final AuthResponse response = await _supabase.auth.signUp(password: password, email:email);
      if(response !=null){
        await _dbservice.insertNewUser(email, response.user!.id);
        Utils.showSnackBar("Successfully registered!", context,color: Colors.green);
        await loginEmployee(email, password, context);
        Navigator.pop(context);

      }

    } catch (e) {
      setIsLoading = false;
      Utils.showSnackBar(e.toString(), context,color: Colors.red);
    }
  }

  Future loginEmployee(String email,String password, BuildContext context) async{
    try {
      setIsLoading = true;
      if(email == "" || password == ""){
        throw ("All Fields are required");
      }
      final AuthResponse response = await _supabase.auth.signUp(password: password, email:email);
      setIsLoading = false;
    } catch (e) {
      setIsLoading = false;
      Utils.showSnackBar(e.toString(), context, color: Colors.red);
    }
  }
  Future signOut() async {
    await _supabase.auth.signOut();
    notifyListeners();
  }

  User? get currentUser => _supabase.auth.currentUser;

  }
