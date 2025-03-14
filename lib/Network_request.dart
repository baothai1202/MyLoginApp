import 'package:http/http.dart' as http;
import 'dart:convert';

class Student {
  String? id;
  late int studentID;
  late String studentName;
  late int phoneNumber;
  Student(
      {required this.studentID,
      required this.studentName,
      required this.phoneNumber});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentID = json['StudentID'];
    studentName = json['Name'];
    phoneNumber = json['PhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['StudentID'] = studentID;
    data['Name'] = studentName;
    data['PhoneNumber'] = phoneNumber;
    return data;
  }
}

class NetworkRequest {
  static const String url =
      'https://67caf6863395520e6af3cd92.mockapi.io/Students/StudentData';

  // static List<Student> ToListStudent(List<dynamic> jsonResponse) {
  //   return jsonResponse.map((student) => Student.fromJson(student)).toList();
  // }

  static Future<Student> getStudent(String studentID) async {
    try {
      final response = await http.get(Uri.parse("$url/$studentID"));
      if (response.statusCode == 200) {
        Student result = json.decode(response.body);
        return result;
      } else {
        throw Exception('Failed to load students from API');
      }
    } catch (ex) {
      throw Exception('Failed to load students from API, ${ex}');
    }
  }

  static Future<List<Student>> getStudents() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> result = json.decode(response.body);
        return result.map((model) => Student.fromJson(model)).toList();
      } else {
        throw Exception('Failed to load students from API');
      }
    } catch (ex) {
      throw Exception('Failed to load students from API, ${ex}');
    }
  }

  static Future<Student> postStudent(Student student) async {
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: json.encode(student.toJson()));

      Map<String, dynamic> result = json.decode(response.body);

      return Student.fromJson(result);
    } catch (ex) {
      throw Exception('Failed to post student to API, ${ex}');
    }
  }

  static Future<void> deleteStudent(String id) async {
    try {
      await http.delete(Uri.parse('$url/$id'));
    } catch (ex) {
      throw Exception('Failed to post student to API, ${ex}');
    }
  }

  static Future<void> updateStudent(Student student, String id) async {
    try {
      await http.put(Uri.parse('$url/${id}'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(student.toJson()));
    } catch (ex) {
      throw Exception('Failed to post student to API, ${ex}');
    }
  }
}
