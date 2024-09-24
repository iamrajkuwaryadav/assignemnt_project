import 'package:assignment_details/assignment1/moor/database_helpers.dart';
import 'package:assignment_details/assignment1/pages/regiSuccesPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Registration extends StatefulWidget {
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var dbHelper;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  final _databaseInstance = AppDatabase.sharedInstance;


  // For TextStyle
  textStyle(double fontsize, FontWeight fontw, Color colors) {
    return TextStyle(fontSize: fontsize, fontWeight: fontw, color: colors);
  }


  // For Text Feild
  Widget textFeildForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Name ",
            style: textStyle(20.0, FontWeight.bold, Colors.black),
          ),
          Container(
            child: TextFormField(
              controller: namecontroller,
              textInputAction: TextInputAction.done,
              // onEditingComplete: () => node.unfocus(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Name';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: false,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter Your Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),

          Text(
            "Birth Date ",
            style: textStyle(20.0, FontWeight.bold, Colors.black),
          ),
          Container(
            child: TextFormField(
              controller: _dateController,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Your Birth Date';
                } else if (value.length != 10) {
                  return 'Please Enter Your Valid Birth Date';
                }
                return null;
              },
              inputFormatters:[
                LengthLimitingTextInputFormatter(10),
              ],
              keyboardType: TextInputType.text,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: false,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter Your Birth Date dd/mm/yyyy',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Text(
            "Email Id ",
            style: textStyle(20.0, FontWeight.bold, Colors.black),
          ),
          Container(
            child: TextFormField(
              controller: emailcontroller,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Your email is required';
                } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: false,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Enter Your Email Id',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),

          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
                // fontSize: 30,
                fontWeight: FontWeight.bold)),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20.0),
        ),
        // color: Colors.blueAccent,
        // textColor: Colors.white,
        onPressed: () {
          DBUser user = DBUser(
              name: namecontroller.text.toString(),
              email: emailcontroller.text.toString(),
              dob: _dateController.text.toString());
          UsersDao(_databaseInstance).addUser(user);

          if(formKey.currentState!.validate()){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => RegiSucess(),
              ),
            );

            namecontroller.clear();
            emailcontroller.clear();
            _dateController.clear();

          }else{}
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome User",
                    style: textStyle(30.0, FontWeight.bold, Colors.black),
                  ),
                  Text(
                    "Please enter your details.",
                    style: textStyle(16.0, FontWeight.normal, Colors.grey),
                  ),
                  textFeildForm(),
                  submitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
