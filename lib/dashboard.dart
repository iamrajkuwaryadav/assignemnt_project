import 'package:assignment_details/assignment1/pages/regiPage.dart';
import 'package:assignment_details/assignment2/pages/empPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBord extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Dash Board"),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Colors.black,
                  textStyle: TextStyle(
                 fontWeight: FontWeight.bold)),
                  child: Text(
                 'Assignment 1',
                  style: TextStyle(fontSize: 20.0),
                   ),
                onPressed: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                      builder: (BuildContext context) => Registration(),
                      ),
                    );
                   },
                  ),
                ),

           SizedBox(height: 25,),

           SizedBox(
             width: MediaQuery.of(context).size.width,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                   primary: Colors.black,
                   // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                   textStyle: TextStyle(
                     // fontSize: 30,
                       fontWeight: FontWeight.bold)),
               child: Text(
                 'Assignment 2',
                 style: TextStyle(fontSize: 20.0),
               ),
               // color: Colors.blueAccent,
               // textColor: Colors.white,
               onPressed: () {
                 Navigator.of(context).push(
                   MaterialPageRoute(
                     builder: (BuildContext context) => Employee(),
                   ),
                 );
               },
             ),
           ),


         ],
       ),
     ),
   );
  }

}