import 'package:employee_login/components/NewTextField.dart';
import 'package:employee_login/controller/get_alll_employee.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  TextEditingController nameController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee',
            style: TextStyle(color: Colors.black, fontSize: 22)),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Fill information to add employee",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            /** name */
            TF(
              controller: nameController,
              hintText: 'Name',
              icon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            /** salary */
            TF(
              keyboardType: TextInputType.number,
              controller: salaryController,
              hintText: 'Salary',
              icon: Icons.money,
            ),
            const SizedBox(height: 20),
            /** age */
            TF(
              controller: ageController,
              hintText: 'Age',
              icon: Icons.calendar_today,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            /** Elevated Button to add employee*/
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.4,
              child: ElevatedButton(
                onPressed: () {
                  //validate form
                  if (nameController.text.isNotEmpty &&
                      salaryController.text.isNotEmpty &&
                      ageController.text.isNotEmpty &&
                      int.parse(ageController.text) > 18 &&
                      int.parse(ageController.text) < 60 &&
                      !ageController.text.toString().contains('.')) {
                    EmployeeOps employeeOps = EmployeeOps();
                    employeeOps.addEmployee(
                      nameController.text,
                      salaryController.text,
                      ageController.text,
                    );
                    //clear text fields
                    nameController.clear();
                    salaryController.clear();
                    ageController.clear();

                    //show snack-bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text('Employee added successfully'),
                      ),
                    );
                  } else {
                    //show snack-bar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content:
                            Text('Please fill all fields or insert valid data'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 15.0,
                  ),
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Add ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
