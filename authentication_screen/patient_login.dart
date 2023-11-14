import 'package:flutter/material.dart';
import 'package:dental_clinic/widget/custom_widget.dart';
import 'package:dental_clinic/const/strings.dart';
import 'package:dental_clinic/const/constants.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({super.key});

  @override
  State<PatientLogin> createState() {
    return _PatientLoginState();
  }
}

class _PatientLoginState extends State<PatientLogin> {
  final formKey = GlobalKey<FormState>();
  //We're creating a global key to Form  or FormState
  //It maintains the FormState
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void loginValidation() {
      if(formKey.currentState!.validate()) {
        // check if Form data are correct
        // it goes to next line only if all data are valid
        const snackBar = SnackBar(content: Text('All data are valid. Login successfully!'),);
        // find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: [
              // Top Portion
              Container(
                height: 200,
                width: width,
                color: Colors.pink.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(patientImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Patients Login...",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Middle portion
              Positioned(
                left: 0,
                top: 160,
                right: 0,
                bottom: 0,
                child: Form(
                  key: formKey,
                  child: Container(
                    padding: const EdgeInsets.all(0), //Try to remove
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                height: 220,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Email",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.email,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText: "Enter email"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-z0-9]+[\.'\-a-z0-9_]*[a-z0-9]+@(gmail|googlemail)\.com+$")
                                                        .hasMatch(value)) {
                                                  //valid patterns
                                                  //admin@gmail.com
                                                  //john.smith@gmail.com
                                                  //john_reo@googlemail.com
                                                  //patrick.o'rielly@googlemail.com
                                                  return "Please enter valid email!!!";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Password",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: TextFormField(
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.lock_outline,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText: "Enter password"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-zA-Z0-9]+$")//(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,12}$
                                                        .hasMatch(value)) {
                                                  return "Please enter valid password!!!";
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              height: 60,
                              color: Colors.pink.shade300,
                              child: TextButton(
                                onPressed: () {
                                  loginValidation();
                                },
                                child: const Center(
                                  child: Text(
                                    login,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                forgetPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(21, 101, 192, 1),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const DoctorLogin(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    asDoctor,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(21, 101, 192, 1),
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Color.fromRGBO(21, 101, 192, 1),
                                      // decorationStyle: TextDecorationStyle.solid,
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      dontHaveAccount,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const PatientSignUp(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        signUp,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color.fromRGBO(21, 101, 192, 1),
                                          decoration: TextDecoration.underline,
                                          decorationColor:
                                              Color.fromRGBO(21, 101, 192, 1),
                                          decorationThickness: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const AdminLogin(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    asAdmin,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(21, 101, 192, 1),
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          Color.fromRGBO(21, 101, 192, 1),
                                      decorationThickness: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
