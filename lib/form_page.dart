import 'package:flutter/material.dart';
import 'student.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  final formKey = GlobalKey<FormState>();

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController sectionController = TextEditingController();

  String? genderValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Handling'),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(30.00),
          children: [
            TextFormField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  hintText: 'ID Number',
                  labelText: 'ID Number'
              ),
              validator: (id) {
                if(id!.isEmpty || !RegExp(r'[0-9]+$').hasMatch(id)) {
                  return 'Please enter your ID Number.';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: 'Name',
                  labelText: 'Name'
              ),
              validator: (name) {
                if(name!.isEmpty || !RegExp(r'[a-z A-Z]+$').hasMatch(name)) {
                  return 'Please enter your Name.';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: birthdateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_month),
                  hintText: 'DD/MM/YYYY',
                  labelText: 'Date of Birth'
              ),
              validator: (birthdate) {
                if(birthdate!.isEmpty || !RegExp(r'[0-9 /]+$').hasMatch(birthdate)) {
                  return 'Please enter your Date of Birth';
                } else {
                  return null;
                }
              }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: courseController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.school),
                    hintText: 'Type your Course...',
                    labelText: 'Course'
                ),
                validator: (course) {
                  if(course!.isEmpty || !RegExp(r'[a-z A-Z]+$').hasMatch(course)) {
                    return 'Please enter your Course.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            TextFormField(
                controller: sectionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    icon: Icon(Icons.schedule_outlined),
                    hintText: 'Type your Section...',
                    labelText: 'Section'
                ),
                validator: (section) {
                  if(section!.isEmpty || !RegExp(r'[a-z A-Z,0-9]+$').hasMatch(section)) {
                    return 'Please enter your Section.';
                  } else {
                    return null;
                  }
                }
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              isExpanded: true,
              hint: const Text(
                'Select Your Gender',
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                )
              ],
              validator: (gender) {
                if(gender == null) {
                  return 'Please select your gender.';
                } else {
                  return null;
                }
              },
              onChanged: (newValue) {
                setState(() {
                  genderValue = newValue;
                });
              },
              onSaved: (yourGender) {
                setState(() {
                  genderValue = yourGender;
                });
              }
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate()) {
                    Student newStudent = Student(
                      id: int.parse(idController.text),
                      name: nameController.text,
                      birthdate: birthdateController.text,
                      course: courseController.text,
                      section: sectionController.text,
                      gender: genderValue.toString()
                    );
                    Navigator.pop(
                        context, newStudent
                    );
                  }
                },
                child: const Text('SUBMIT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
