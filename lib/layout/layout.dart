import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/layout/cubit/cubit.dart';
import 'package:medical_app/layout/cubit/states.dart';
import 'package:medical_app/modules/contact_us_screen.dart';
import 'package:medical_app/shared/colors.dart';
import 'package:medical_app/shared/components.dart';

class MedicalLayout extends StatelessWidget {
  const MedicalLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = MedicalCubit.get(context);
    return BlocConsumer<MedicalCubit,MedicalStates>(
      listener:(context,states){
        },
      builder:(context,states) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.blue),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Image(
            height: 32,
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/images/logo-medical.png',
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              navigateTo(context, ContactUsScreen());
            },
              icon:SvgPicture.asset(
                'assets/svg/phone_outgoing.svg',
                color: defaultColor,
              )
            ),
          ],
        ),
        body:cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: cubit.currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            cubit.changeNavBar(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label:'Home'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_services),
                label:'Departments'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp),
                label:'Doctors'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.addchart_sharp),
                label:'Resources'
            ),
          ],

        ),
      ),
    );
  }
}
