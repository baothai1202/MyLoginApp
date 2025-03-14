import 'package:flutter_bloc/flutter_bloc.dart';
import 'Network_request.dart';

class studentState {
  final int? studentID;
  final int? phoneNumber;
  final String? name;

  final bool confirm;
  final bool addloading;
  final bool posting;

  studentState(
      {required this.studentID,
      required this.phoneNumber,
      required this.name,
      required this.confirm,
      required this.addloading,
      required this.posting});
}

abstract class StudentblocEvent {}

class addStudentPage extends StudentblocEvent {
  final bool addloading;
  addStudentPage({required this.addloading});
}

class studentEvent extends StudentblocEvent {
  String? name;
  int? studentID;
  int? phoneNumber;

  final bool addStudent;
  studentEvent({
    required this.studentID,
    required this.phoneNumber,
    required this.name,
    required this.addStudent,
  });
}

class studentBloc extends Bloc<StudentblocEvent, studentState> {
  studentBloc()
      : super(studentState(
            studentID: 0,
            phoneNumber: 0,
            name: '0',
            addloading: false,
            confirm: false,
            posting: false)) {
    on<addStudentPage>(((event, emit) {
      emit(studentState(
          studentID: 0,
          phoneNumber: 0,
          name: '0',
          confirm: false,
          addloading: event.addloading,
          posting: false));
    }));
    on<studentEvent>((event, emit) async {
      emit(studentState(
          studentID: state.studentID,
          phoneNumber: state.phoneNumber,
          name: state.name,
          confirm: false,
          addloading: state.addloading,
          posting: false));
      if (event.addStudent) {
        emit(studentState(
            studentID: event.studentID,
            phoneNumber: event.phoneNumber,
            name: event.name,
            addloading: state.addloading,
            confirm: false,
            posting: false));
      }
      if (event.studentID != null &&
          event.phoneNumber != null &&
          event.name != null &&
          event.addStudent &&
          event.studentID != "" &&
          event.phoneNumber != "" &&
          event.name != "" &&
          event.addStudent) {
        emit(studentState(
            studentID: state.studentID,
            phoneNumber: state.phoneNumber,
            name: state.name,
            addloading: false,
            confirm: true,
            posting: true));
        // ------------------------------------------
        Student student = new Student(
            studentID: event.studentID!,
            studentName: event.name!,
            phoneNumber: event.phoneNumber!);
        Student studentRes = await NetworkRequest.postStudent(student);
// ------------------------------------------------------------
        emit(studentState(
            studentID: studentRes.studentID,
            phoneNumber: studentRes.phoneNumber,
            name: studentRes.studentName,
            addloading: false,
            confirm: true,
            posting: false));
      }
    });
  }
}
