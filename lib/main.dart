import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/layout/cubit/cubit.dart';
import 'package:medical_app/modules/contact_us_screen.dart';

import 'layout/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (contex) => MedicalCubit()..createDepartments()..createDoctors(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          ),
          home: const MedicalLayout(),
        ),
    );
  }
}
