
import 'package:assignment_details/assignment1/moor/database_helpers.dart';
import 'package:flutter/material.dart';



class RegiSucess extends StatefulWidget {
  @override
  _RegiSucessState createState() => _RegiSucessState();
}

class _RegiSucessState extends State<RegiSucess> {
  textStyle(double fontsize, FontWeight fontw, Color colors) {
    return TextStyle(fontSize: fontsize, fontWeight: fontw, color: colors);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: getalluser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("snapshotfata${snapshot.data}");
              if (snapshot.data == null) {
                return Container();
              } else {
                return Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Registration Successful",
                      style: textStyle(30.0, FontWeight.bold, Colors.black),
                    ),
                    Text(
                      "Your Details are Submitted successfully",
                      style: textStyle(16.0, FontWeight.normal, Colors.grey),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                     dataBody(snapshot.data,context),
                  ],
                );
              }
            },
          ),
        ),
      ),
      // body: SafeArea(
      //
      //
      //   child: Column(children: <Widget>[
      //     SizedBox(
      //       height: 25,
      //     ),
      //     Text(
      //       "Registration Successful",
      //       style: textStyle(30.0, FontWeight.bold, Colors.black),
      //     ),
      //     Text(
      //       "Your Details are Submitted successfully",
      //       style: textStyle(16.0, FontWeight.normal, Colors.grey),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         child: DataTable(
      //           showBottomBorder: true,
      //           dividerThickness: 1.0,
      //           border: TableBorder.all(),
      //           columns: const <DataColumn>[
      //             DataColumn(
      //               label: Text(
      //                 'Name',
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //               ),
      //             ),
      //             DataColumn(
      //               label: Text(
      //                 'Birthday',
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //               ),
      //             ),
      //             DataColumn(
      //               label: Text(
      //                 'Email Id',
      //                 style:
      //                     TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      //               ),
      //             ),
      //           ],
      //           rows: const <DataRow>[
      //             DataRow(
      //               cells: <DataCell>[
      //                 DataCell(Text('Albert')),
      //                 DataCell(Text('19')),
      //                 DataCell(Text('Student')),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ]),
      // ),
    );
  }
}

Future<List<DBUser>> getalluser() async {
  List<DBUser> users = [];
  final _databaseInstance = AppDatabase.sharedInstance;
  try {
    final _users = await UsersDao(_databaseInstance).getAllUser();
    if (_users != null) {
      users.addAll(_users);
    }
  } catch (ex) {
    users = [];
  }

  return users;
}


SingleChildScrollView dataBody(List<DBUser> emplist,BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          showBottomBorder: true,
          dividerThickness: 1.0,
          border: TableBorder.all(),
          sortColumnIndex: 1,
          columns: [
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Birthday',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Email Id',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
          rows: emplist
              .map(
                (emp) =>
                DataRow(
                    cells: [
                      DataCell(
                          Text(emp.name)
                      ),
                      DataCell(
                          Text(emp.dob)
                      ),
                      DataCell(
                        Container(
                          width:MediaQuery.of(context).size.width*0.2,
                            child: Text(emp.email,
                              overflow: TextOverflow.visible,
                              softWrap: true,)),
                      ),
                    ]),
          )
              .toList(),
        ),
      ),
  );
}
