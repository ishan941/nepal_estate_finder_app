import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/core/utils/loader.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/features/student/presentation/provider/student_provider.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});
  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    //await Provider.of<StudentProvider>(context, listen: false).getStudent();
    Future.delayed(Duration.zero, () async {
      await context.read<StudentProvider>().getStudent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<StudentProvider>(
        builder: (context, studentProvider, child) => Stack(
          children: [
            userInterface(studentProvider),
            loader(studentProvider, context)
          ],
        ),
      )),
    );
  }

  Widget userInterface(StudentProvider studentProvider) => studentProvider
                  .studentList !=
              null &&
          studentProvider.studentList!.isNotEmpty
      ? ListView.builder(
          itemCount: studentProvider.studentList?.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : ${studentProvider.studentList?[index].name}"),
                    Text(
                        "Address : ${studentProvider.studentList?[index].address}"),
                    Text(
                        "Gender : ${studentProvider.studentList?[index].gender}"),
                    Text(
                        "Name : ${studentProvider.studentList?[index].contactNumber}")
                  ],
                ),
              ),
            );
          })
      : const SizedBox.shrink();

  Widget loader(StudentProvider studentProvider, BuildContext context) {
    if (studentProvider.gettudentStatus == StatusUtil.loading) {
      return Loader.backdropFilter(context);
    } else {
      return const SizedBox.shrink();
    }
  }
}
