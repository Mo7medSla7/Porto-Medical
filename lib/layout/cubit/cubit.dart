import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/layout/cubit/states.dart';
import 'package:medical_app/modules/departments_screen.dart';
import 'package:medical_app/modules/doctors_screen.dart';
import 'package:medical_app/modules/home_screen.dart';
import 'package:medical_app/modules/resources_screen.dart';
import 'package:medical_app/shared/colors.dart';
import 'package:medical_app/shared/components.dart';

import '../../models/departments_model.dart';
import '../../models/doctors_model.dart';

class MedicalCubit extends Cubit<MedicalStates>{
  MedicalCubit() : super(InitState());

  static MedicalCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget>  screens = const [
    HomeScreen(),
    DepartmentsScreen(),
    DoctorsScreen(),
    ResourcesScreen(),
  ];

  void changeNavBar(int index){
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  List<DepartmentsModel> departments = [];

  void createDepartments(){
    List<String> departmentsNames =[
      'Cardiology',
      'Gastroenterology',
      'Pulmonology',
      'Dental',
      'Gynecology',
      'Hepatology',
    ];
    List<String> departmentsImages =[
      'assets/images/department_icon_cardiology.png',
      'assets/images/department_icon_gastroenterology.png',
      'assets/images/department_icon_pulmonology.png',
      'assets/images/department_icon_dental.png',
      'assets/images/department_icon_gynecology.png',
      'assets/images/department_icon_hepatology.png',
    ];
    for(int i =0; i < departmentsNames.length ;i++){
      departments.add(DepartmentsModel(departmentsNames[i],departmentsImages[i]));
    }
  }

  Widget buildDepartmentDetailsScreen(DepartmentsModel model)=>
  Scaffold(
    appBar: AppBar(
      title: Text(
        model.name,
        style: const TextStyle(
          color: defaultColor,
          fontWeight: FontWeight.bold
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image(
          image: AssetImage(model.image),
          height: 30,
          width: 30,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'At Porto Medical, we offer a wide array of departments, gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: Text(
                    dummyText,
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const Expanded(
                  child: Image(
                    image: AssetImage('assets/images/resources1.jpg'),

                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0,),
            Row(
              children: const [
                Icon(
                  Icons.arrow_right,
                  color: defaultColor,
                  size: 30,
                ),
                SizedBox(width: 8.0,),
                Text(
                  'Symptoms',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            Text(dummyText),
            const SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Icon(Icons.looks_one_outlined,color: defaultColor,),
                  SizedBox(width: 10.0,),
                  Text(
                  'Lorem ipsum consectetur adipi;'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Icon(Icons.looks_two_outlined,color: defaultColor,),
                  SizedBox(width: 10.0,),
                  Text(
                  'Integer molestie facilisis in pre;'
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Icon(Icons.looks_3_outlined,color: defaultColor,),
                  SizedBox(width: 10.0,),
                  Text(
                  'Faucibus porta la;'
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            Row(
              children: const [
                Icon(
                  Icons.arrow_right,
                  color: defaultColor,
                  size: 30,
                ),
                SizedBox(width: 8.0,),
                Text(
                  'Diagnosis',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            Text(dummyText),

          ],
        ),
      ),
    ),
  );

List<DoctorsModel> doctors =[];

void createDoctors() {
  List<String> doctorsNames = [
    'John Doe',
    'Robin Doe',
    'Jessica Doe',
    'Rose Doe',
    'Mary Ann Doe',
  ];
  List<String> doctorsDepartments = [
    'Cardiology',
    'Gastroenterology',
    'Pulmonology',
    'Dental',
    'Gynecology',
  ];
  List<String> doctorsImages = [
    'assets/images/doctor1.jpg',
    'assets/images/doctor2.jpg',
    'assets/images/doctor3.jpg',
    'assets/images/doctor4.jpg',
    'assets/images/doctor5.jpg',
  ];

  for (int i = 0; i < doctorsNames.length; i++) {
    doctors.add(
        DoctorsModel(doctorsNames[i], doctorsDepartments[i], doctorsImages[i]));
  }
}

Widget buildDoctorDetailsScreen(DoctorsModel model)=>
    Scaffold(
      appBar: AppBar(
        title:  const Text('Doctor Info',
        style:  TextStyle(
          color: defaultColor,
          ),
        ),
        iconTheme: const IconThemeData(
          color: defaultColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
       children: [
         Row(
           // crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Image(
               height: 200,
               width: 150,
               image:AssetImage(
                   model.image,
                 ),),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 40.0,),
                 Text(
                   model.name,
                   style:const TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 Text(
                   model.department,
                   style:const TextStyle(
                     fontSize: 16,
                   ),
                 ),
                 const SizedBox(height: 8.0,),
                 Row(
                   children: const [
                     Icon(
                       Icons.check_circle_rounded,
                       size: 15,
                       color: defaultColor,
                     ),
                     SizedBox(width: 8.0,),
                     Text('Surgeries'),
                   ],
                 ),
                 const SizedBox(height: 8.0,),
                 Row(
                   children: const [
                     Icon(
                       Icons.check_circle_rounded,
                       size: 15,
                       color: defaultColor,
                     ),
                     SizedBox(width: 8.0,),
                     Text('Neck Pain'),
                   ],
                 ),
                 const SizedBox(height: 8.0,),
                 Row(
                   children: const [
                     Icon(
                       Icons.check_circle_rounded,
                       size: 15,
                       color: defaultColor,
                     ),
                     SizedBox(width: 8.0,),
                     Text('Cervical Myelopathy'),
                   ],
                 ),
               ],
             ),
           ],
         ),
         const SizedBox(height: 20.0,),
         const Text(
           'Doctor Bio',
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 24
           ),
         ),
         const SizedBox(height: 20.0,),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(dummyText+dummyText),
               const SizedBox(height: 20.0,),
               Text(dummyText),
             ],
           ),
         )
       ],
      ),
    );

}

