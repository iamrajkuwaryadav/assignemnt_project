
import 'package:assignment_details/assignment2/models/empModel.dart';
import 'package:assignment_details/assignment2/pages/empDetailsPages.dart';
import 'package:assignment_details/assignment2/services/apiService.dart';
import 'package:flutter/material.dart';



class Employee extends StatefulWidget{
  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {

  late Future<EmployeeModel> futureAlbum;

  @override
  void initState() {
    super.initState();
  }


  Widget projectWidget() {
    return FutureBuilder<List<EmployeeModel>>(
      builder: (context, snap) {
        if (snap.hasData) {
          return ListView(
            children: [
              ...snap.data!.map((e) => InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      e: e,
                    ),
                  ),
                ),
                child:
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.name,style: textStyle(),),
                        Text("${e.age}",style: textStyle(),),
                        Text("${e.salary}",style: textStyle(),),
                        Divider(
                          height: 20,
                          thickness: 2,
                          color: Colors.white,
                        ),

                      ],
                    ),
                ),
                )
              )
            ],
          );
        } else if (snap.hasError) {
          return Text('${snap.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
      future: ApiService().getUser(),
    );
  }

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
      backgroundColor: Colors.black45,
      appBar: AppBar(title: Text("Employee Dummy"),backgroundColor: Colors.black,),
      body: projectWidget(),

    );
  }
}