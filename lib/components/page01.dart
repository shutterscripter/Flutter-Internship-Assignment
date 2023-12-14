import 'package:employee_login/components/employee_detail_card.dart';
import 'package:employee_login/controller/get_alll_employee.dart';
import 'package:employee_login/models/getEmpModel.dart';
import 'package:flutter/material.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({Key? key}) : super(key: key);

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  List<GetEmpModel> employeeList = [];
  bool flag = true;

  @override
  void initState() {
    var employeeOps = EmployeeOps();
    Future<List<GetEmpModel>> list = employeeOps.getAllEmployee();
    list.then((value) {
      setState(() {
        employeeList = value;
        flag = false;
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: flag
          ? const Center(
            child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
          )
          : ListView.builder(
              itemCount: employeeList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmployeeInfoCard(
                            employee: employeeList[index],
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.orangeAccent,
                      child: Text(employeeList[index].employeeName![0],
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(
                      employeeList[index].employeeName ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text('Age: ${employeeList[index].employeeAge}'),
                  ),
                );
              },
            ),
    );
  }
}
