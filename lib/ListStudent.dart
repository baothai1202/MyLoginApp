import 'package:flutter/material.dart';
import 'package:flutter_application_1/studentBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Network_request.dart';
import 'Update.dart';

class Liststudent extends StatefulWidget {
  @override
  State<Liststudent> createState() => _ListstudentState();
}

class _ListstudentState extends State<Liststudent> {
  List<Student> lists = [];
  bool loading = false;
  bool adding = true;
  String? checkID;
  String? yourName;

  int? studentID;
  int? phoneNumber;
  void getListStudent() async {
    lists = await NetworkRequest.getStudents();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListStudent();
  }

  @override
  Widget build(BuildContext context) {
    final double y = MediaQuery.of(context).size.height;
    final double x = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD8B5FF), // Màu tím nhạt
                Color(0xFF1EAE98)
              ]),
        ),
        height: y,
        width: x,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Students',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                    )),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          loading = true;
                        });

                        getListStudent();
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        alignment: Alignment.center,
                        child: loading
                            ? SizedBox(child: CircularProgressIndicator())
                            : Icon(Icons.replay_outlined),
                      )),
                ],
              ),
            ),
            Expanded(child: BlocBuilder<studentBloc, studentState>(
                builder: (context, state) {
              return Stack(
                children: [
                  ListView.builder(
                      itemCount: lists.length,
                      itemBuilder: (context, index) {
                        return AnimatedSwitcher(
                          duration: Duration(milliseconds: 800),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateStudent(
                                              student: lists[index],
                                              getstudents: getListStudent,
                                            )));
                              },
                              key: ValueKey(lists[index]),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.blue[100],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50)),
                                            ),
                                            padding: EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                            )),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              lists[index].studentName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(lists[index]
                                                .phoneNumber
                                                .toString())
                                          ],
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      iconSize: 20,
                                      onPressed: () async {
                                        setState(() {
                                          loading = true;
                                          checkID = lists[index].id;
                                        });
                                        if (lists[index].id != null) {
                                          await NetworkRequest.deleteStudent(
                                              lists[index].id!);
                                          getListStudent();
                                        }
                                      },
                                      icon:
                                          loading && lists[index].id == checkID
                                              ? CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                    )
                                  ],
                                ),
                              )),
                        );
                        // Your itemBuilder code here
                      }),
                  state.addloading
                      ? Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10, top: 50),
                                  child: TextField(
                                    onChanged: (value) {
                                      yourName = value;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Enter Your Name',
                                        errorText: (state.name == null ||
                                                state.name == "")
                                            ? 'Your StudentID emty or not in the correct format'
                                            : null,
                                        suffixIcon: Icon(Icons.person)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    onChanged: (value) {
                                      studentID = int.tryParse(value);
                                    },
                                    decoration: InputDecoration(
                                        errorText: (state.studentID == null ||
                                                state.studentID == "")
                                            ? 'Your StudentID emty or not in the correct format'
                                            : null,
                                        hintText: 'Enter StudentID',
                                        suffixIcon:
                                            Icon(Icons.assignment_ind_rounded)),
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(10),
                                  child: TextField(
                                    onChanged: (value) {
                                      phoneNumber = int.tryParse(value);
                                    },
                                    decoration: InputDecoration(
                                        errorText: (state.phoneNumber == null ||
                                                state.phoneNumber == "")
                                            ? 'Your StudentID emty or not in the correct format'
                                            : null,
                                        hintText: 'Enter Phone Number',
                                        suffixIcon: Icon(Icons.phone)),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                        onTapDown: (details) {
                                          context.read<studentBloc>().add(
                                              studentEvent(
                                                  addStudent: true,
                                                  name: yourName,
                                                  phoneNumber: phoneNumber,
                                                  studentID: studentID));
                                        },
                                        onTapUp: (details) {
                                          context.read<studentBloc>().add(
                                              studentEvent(
                                                  addStudent: false,
                                                  name: state.name,
                                                  phoneNumber:
                                                      state.phoneNumber,
                                                  studentID: state.studentID));
                                          // Add your logic here
                                        },
                                        child: Container(
                                            margin: EdgeInsets.all(10),
                                            padding: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.lightBlue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Text(
                                              'Add Student',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ))),
                                  ),
                                ],
                              )
                            ],
                          ))
                      : SizedBox(),
                  state.confirm
                      ? Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: x,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        child: Text(
                                          'Posted Successfully',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                          'Student\'s Name: ${state.name}')),
                                  Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                          'StudentID: ${state.studentID}')),
                                  Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Text(
                                          'Phone Number: ${state.phoneNumber}')),
                                  Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        yourName = null;
                                        phoneNumber = null;
                                        studentID = null;
                                        getListStudent();
                                        context.read<studentBloc>().add(
                                            studentEvent(
                                                studentID: 0,
                                                phoneNumber: 0,
                                                name: '0',
                                                addStudent: false));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.lightBlue,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Text(
                                          'Back to List Student',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      : SizedBox(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding:
                            EdgeInsets.only(bottom: y * 0.05, right: x * 0.05),
                        child: FloatingActionButton(
                            child: Container(
                              child: state.addloading
                                  ? Icon(Icons.list_alt)
                                  : Icon(Icons.person_add_alt_1),
                            ),
                            onPressed: () {
                              context.read<studentBloc>().add(addStudentPage(
                                  addloading: !state.addloading));
                            }),
                      ))
                ],
              );
            }))
          ],
        ),
      ),
    ));
  }
}
