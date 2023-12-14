import 'dart:convert';

import 'package:employee_login/models/getEmpModel.dart';
import 'package:http/http.dart' as http;

class EmployeeOps {
  Future<List<GetEmpModel>> getAllEmployee() async {
    final response = await http.get(
        Uri.parse('http://dummy.restapiexample.com/api/v1/employees'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final Map<String, dynamic> jsonResponse =
      json.decode(response.body); // Parse the entire JSON response

      final List<dynamic> employeeData = jsonResponse['data'];

      // Map each JSON object to your model class
      final List<GetEmpModel> employeeList =
      employeeData.map((json) => GetEmpModel.fromJson(json)).toList();

      return employeeList;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or handle the error as needed.
      throw Exception('Failed to load data');
    }
  }


  //delete employee
  Future<bool> deleteEmployee(String id) async {
    final response = await http.delete(
      Uri.parse('http://dummy.restapiexample.com/api/v1/delete/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //add employee
  Future<bool> addEmployee(String name, String salary, String age) async {
    final response = await http.post(
      Uri.parse('http://dummy.restapiexample.com/api/v1/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'name': name, 'salary': salary, 'age': age}),
    );

    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}
