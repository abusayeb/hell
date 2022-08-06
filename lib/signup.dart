

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hell/login.dart';
import 'package:hell/widgets.dart';
import 'package:lottie/lottie.dart';


class signUp extends StatefulWidget {
  signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  @override
  String name="";
  String email="";
  String password="";
  String confirmPass="";
  String username="";
  final formkey=GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              //Lottie Image
              Container(
                child: Lottie.asset("asset/signup.json"),
              ),

              //Signup text
              Container(
                height: 45,
                width: 600,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                      color:const Color.fromARGB(255, 222, 79, 247), width: 3),
                ),
                alignment: Alignment.center,
                child: Text("Sign up Here",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 36,
                      color: Colors.white,
                    )),
              ),
              space(20),

              Form(
                key: formkey,
                child: Column(
                  children: [
                    //Name textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            decoration: textInputDecoration.copyWith(
                                prefixIcon:
                                    const Icon(Icons.account_circle, color: Colors.blue),
                                hintText: "Full name",
                                hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                            onChanged: (value) {
                              setState(() {
                                name = value;
                                print(email);
                              });
                            },
                            validator: (val){
                              if(val!.length==0){
                                return "Name can't be null";
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    space(10),
                    
                    //Username field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            decoration: textInputDecoration.copyWith(
                                prefixIcon:
                                    const Icon(Icons.account_circle, color: Colors.blue),
                                hintText: "username",
                                hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                            onChanged: (value) {
                              setState(() {
                                username = value;
                                print(username);
                              });
                            },
                            validator: (value){
                              if(value!.length>8){
                                return "username must be less than 8 characters";
                              }else if(value.length<5){
                                return "username must be at least 5 characters";
                              }else{
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    space(10),

                    //Email textfield
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            decoration: textInputDecoration.copyWith(
                                prefixIcon:
                                    const Icon(Icons.mail, color: Colors.blue),
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                            onChanged: (value) {
                              setState(() {
                                email = value;
                                print(email);
                              });
                            },
                            validator: (val) {
                              bool isValid = EmailValidator.validate(val!);
                              return isValid
                                  ? null
                                  : "Please enter a valid email";
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    space(10),

                    //Password Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                prefixIcon: const Icon(Icons.vpn_key,
                                    color: Colors.blue),
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                            onChanged: (value) {
                              setState(() {
                                password = value;
                                print(password);
                              });
                            },
                            validator: (val) {
                              if (val!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    space(10),

                    //confirm password file
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.blueAccent,
                            obscureText: true,
                            decoration: textInputDecoration.copyWith(
                                prefixIcon: const Icon(Icons.key,
                                    color: Colors.blue),
                                hintText: "Confirm password",
                                hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                )),
                            onChanged: (value) {
                              setState(() {
                                confirmPass = value;
                                print(confirmPass);
                              });
                            },
                            validator: (val) {
                              if (val==password) {
                                return null;
                              } else {
                                return "doesn't match";
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              space(10),
              

              //Sign in button
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(
                          255, 196, 71, 218), //background color of button
                      side: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 98, 153,
                              249)), //border width and color //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15) //content padding inside button
                      ),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
              
              //Footer text
              Text.rich(textSpan(
                  context, const LogIn(), "Already have an account? ", "Sign in")),
                  space(30)
            ],
          ),
        ),
      ),
    );
  }
  login(){
    
  }
}