import 'package:flutter/material.dart';
import 'package:medical_app/layout/cubit/cubit.dart';
import 'package:medical_app/models/departments_model.dart';
import 'package:medical_app/shared/components.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>buildDepartmentsListItem(MedicalCubit.get(context).departments[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: MedicalCubit.get(context).departments.length
    );
  }

  Widget buildDepartmentsListItem(DepartmentsModel model,context)=>
  Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(model.image)),
        const SizedBox(width: 15.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
              const SizedBox(height: 10.0,),
              Text(
                dummyText,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16
              ),),
              const SizedBox(height: 10.0,),
              basicButton(
                  onPressed: (){
                    Widget departmentDetails = MedicalCubit.get(context).buildDepartmentDetailsScreen(model);
                    navigateTo(context, departmentDetails);
                  },
                  title:'view more...')
            ],
          ),
        ),
      ],
    ),
  )
  ;
}