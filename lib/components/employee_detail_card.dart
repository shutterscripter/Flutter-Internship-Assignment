import 'package:employee_login/controller/get_alll_employee.dart';
import 'package:employee_login/models/getEmpModel.dart';
import 'package:flutter/material.dart';

class EmployeeInfoCard extends StatefulWidget {
  final GetEmpModel? employee;

  const EmployeeInfoCard({super.key, this.employee});

  @override
  State<EmployeeInfoCard> createState() => _EmployeeInfoCardState();
}

class _EmployeeInfoCardState extends State<EmployeeInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Employee Info',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.orangeAccent,
                  child: Text(widget.employee!.employeeName![0],
                      style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.employee!.employeeName ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Employee ID: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.employee!.id ?? ''),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Employee Age: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.employee!.employeeAge ?? ''),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Employee Salary: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.employee!.employeeSalary ?? ''),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                EmployeeOps employeeOps = EmployeeOps();
                await employeeOps.deleteEmployee(widget.employee!.id!);
                Navigator.pop(context);

                await ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Employee Deleted'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Delete Employee'),
            )
          ],
        ),
      ),
    );
  }
}
