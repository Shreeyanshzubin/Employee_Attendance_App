import 'dart:ui';

import 'package:employee_attendance_app/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
              height: screenHeight / 4,
              width: screenWidth,
              decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70)
                  )
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code_scanner,color: Colors.white,size: 80),
                  SizedBox(height: 20,),
                  Text("FAANG" ,style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,fontWeight: FontWeight.bold
                  ),)
                ],
              )
          ),
          const SizedBox(height: 50,),
          Padding(padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    label: Text("Employee Email ID"),
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  controller: _emailcontroller,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  controller: _passwordcontroller,
                  obscureText: true,
                ),
                const SizedBox(height: 30,),
                Consumer<AuthService>(
                  builder: (context,authServiceProvider,child){
                    return SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: authServiceProvider.isLoading ? const Center(
                        child: CircularProgressIndicator(),
                      ): ElevatedButton(onPressed: (){
                          authServiceProvider.registerEmployee(_emailcontroller.text.trim(),
                              _passwordcontroller.text.trim(),
                              context);
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),child: const Text("Register",style: TextStyle(fontSize: 20),),),
                    );
                  },
                ),
              ],
            ),)
        ],
      ),
    );
  }
}
