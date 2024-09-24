import 'dart:convert';



import 'package:assignment_details/assignment2/models/empModel.dart';
import 'package:http/http.dart';

class ApiService {
  String endpoint = 'http://aamras.com/dummy/EmployeeDetails.json';

  Future<List<EmployeeModel>> getUser() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['employees'];
      return result.map(((e) => EmployeeModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}