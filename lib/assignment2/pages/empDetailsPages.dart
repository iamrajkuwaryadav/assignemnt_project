
import 'package:assignment_details/assignment2/models/empModel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, required this.e}) : super(key: key);
  EmployeeModel e;

  textStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("EmployeeDetails",),
        backgroundColor: Colors.black,
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(e.name,style: textStyle(),),
              Text("${e.age}",style: textStyle(),),
              Text("${e.salary}",style: textStyle(),),
            ],
          ),
        ),
      ),
    );
  }
}