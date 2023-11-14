import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dental_clinic/widget/custom_widget.dart';
import 'package:dental_clinic/const/strings.dart';
import 'package:dental_clinic/const/constants.dart';
import 'package:dental_clinic/model/patient.dart';

class PatientSignUp extends StatefulWidget {
  const PatientSignUp({super.key});

  @override
  State<PatientSignUp> createState() {
    return _PatientSignUpState();
  }
}

class _PatientSignUpState extends State<PatientSignUp> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final List<String> _registeredEmails = [];
    // final List<String> _registerdPhoneNumbers = [];
    // final List<Patient> _registerdPatients = [];
    // Future<List<Patient>> registeredPatientsList() {
    //   return FirebaseFirestore.instance
    //         .collection('patients')
    //         .snapshots()
    //         .map((snapshot) => snapshot.docs.map((doc) => Patient.fromJson(doc.data())));
    

    Future validateSignUp(Patient patient) async {
      if (formKey.currentState!.validate()) {
         
        // FirebaseFirestore.instance.collection('patients') used as reference to collection
        // doc() method used for generating IDs. We can also create own ID using it as doc('my-id')

        final patientDoc =
            FirebaseFirestore.instance.collection('patients').doc();
        final json = patient.toJson();

        // create document and write data on it
        // by using patientDoc that is called as DocumentReference<Map<String, dynamic>>
        await patientDoc
            .set(json)
            .whenComplete(
              () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Success! your account has been created.",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color.fromRGBO(102, 187, 106, 1),
                ),
              ),
            )
            .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Error! Something went wrong. Try again",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
          print(error.toString());
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Error! Something went wrong. Try again",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
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
                      "Patients Sign Up...",
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
              Positioned(
                left: 0,
                top: 160,
                right: 0,
                bottom: 0,
                child: Form(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                // r"[a-zA-z0-9_-]{3,15}$  name
                                // r"^[a-z0-9]+[\.'\-a-z0-9_]*[a-z0-9]+@(gmail|googlemail)\.com+$" "i.e:- karthi01@mail.com"
                                // r"[0-9]{5}\s[0-9]{5}$"
                                //r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,12}$"
                                //Please enter valid password!!!
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // textFields
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Name",
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
                                              controller: nameController,
                                              keyboardType: TextInputType.name,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.person,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText: "Enter name"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"[a-zA-z]{3,15}$")
                                                        .hasMatch(value)) {
                                                  return "Please enter valid name!!!";
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
                                              controller: emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.email,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText:
                                                      "i.e:- karthi01@mail.com"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-z0-9]+[\.'\-a-z0-9_]*[a-z0-9]+@(gmail|googlemail)\.com+$")
                                                        .hasMatch(value)) {
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
                                            "Phone Number",
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
                                              controller: phoneNumberController,
                                              keyboardType: TextInputType.phone,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.phone,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText: "88888 11111"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"[0-9]{5}\s[0-9]{5}$")
                                                        .hasMatch(value)) {
                                                  return "Please enter valid phone number!!!";
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
                                              controller: passwordController,
                                              keyboardType: TextInputType.text,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              decoration: ourTextfieldColor(
                                                  prefixIcon: const Icon(
                                                    Icons.lock_outline,
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                  ),
                                                  hintText: "Enter password"),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-zA-Z0-9]+$")
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
                                    const SizedBox(
                                      height: 20,
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
                                  validateSignUp(
                                    Patient(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phoneNumber: phoneNumberController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    signUp,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
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
                                        builder: (context) =>
                                            const DoctorLogin(),
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
                                      haveAccount,
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
                                                const PatientLogin(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        login,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromRGBO(21, 101, 192, 1),
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
                                        builder: (context) =>
                                            const AdminLogin(),
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
