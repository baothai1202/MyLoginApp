import 'package:flutter/material.dart';
import 'package:flutter_application_1/Network_request.dart';

class UpdateStudent extends StatefulWidget {
  late Student student;
  late Function getstudents;
  UpdateStudent({required this.student, required this.getstudents});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  bool updating = false;
  late Function getstudentsRef;
  late Student studentRef;
  late TextEditingController name = TextEditingController();
  late TextEditingController studentID = TextEditingController();
  late TextEditingController phoneNumber = TextEditingController();
  @override
  void initState() {
    super.initState();
    studentRef = widget.student;
    name.text = studentRef.studentName;
    getstudentsRef = widget.getstudents;

    studentID.text = studentRef.studentID.toString();
    phoneNumber.text = studentRef.phoneNumber.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Update Student'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Student\'s name: '),
                Expanded(
                  child: TextField(
                    controller: name,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Student\'s ID: '),
                Expanded(
                  child: TextField(
                    controller: studentID,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Student\'s phone number: '),
                Expanded(
                  child: TextField(
                    controller: phoneNumber,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              setState(() {
                updating = true;
              });
              Student student = Student(
                studentID: int.parse(studentID.text),
                studentName: name.text,
                phoneNumber: int.parse(phoneNumber.text),
              );

              await NetworkRequest.updateStudent(student, studentRef.id!);
              getstudentsRef();
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 140, vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: updating
                  ? CircularProgressIndicator()
                  : Text(
                      'Upadate',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
