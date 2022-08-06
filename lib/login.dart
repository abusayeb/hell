import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hell/signup.dart';
import 'package:hell/widgets.dart';
import 'package:lottie/lottie.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "";
  String password = "";

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Lottie.asset("asset/signup.json"),
                ),

                //welcome text
                Container(
                  height: 50,
                  width: 600,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                        color: const Color.fromARGB(255, 222, 79, 247),
                        width: 4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Welcome",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
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

                        const SizedBox(height: 10),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
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
                        const SizedBox(height: 10),
                        //sign in button

                        ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 196, 71,
                                    218), //background color of button
                                side: const BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 98, 153,
                                        249)), //border width and color //elevation of button
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(5)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                        15) //content padding inside button
                                ),
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 20,
                                color: Colors.white,
                           ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Text.rich(textSpan(
                  context, signUp(), "Don't have an account? ", "Register now")),
                  const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() {
    if (formkey.currentState!.validate()) {}
  }
}
