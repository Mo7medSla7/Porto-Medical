import 'package:flutter/material.dart';
import 'package:medical_app/layout/cubit/cubit.dart';

import '../models/doctors_model.dart';
import '../shared/components.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  List<Widget> doctors =List.generate(MedicalCubit.get(context).doctors.length, (index) =>
  buildDoctorItem(MedicalCubit.get(context).doctors[index],context));

  doctors = doctors + doctors;

    return GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 2.0,
        childAspectRatio: 1 / 1.7 ,
        children: doctors,
    );

  }

  Widget buildDoctorItem(DoctorsModel model,context){
    return Column(
      children: [
        Image(image: AssetImage(
          model.image,
        ),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.department,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 4.0,),
                Text(
                  model.name,
                  style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ) ,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              iconSize: 26,
              onPressed: (){
                Widget doctorDetails = MedicalCubit.get(context).buildDoctorDetailsScreen(model);
                navigateTo(context, doctorDetails);
              },
              icon: const Icon(Icons.arrow_circle_right_outlined),
            ),
          ],
        ),
      ],
    );
  }

}