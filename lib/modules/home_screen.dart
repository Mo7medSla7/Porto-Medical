import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/layout/cubit/cubit.dart';
import 'package:medical_app/models/doctors_model.dart';
import 'package:medical_app/modules/about_us_screen.dart';
import 'package:medical_app/shared/components.dart';

import '../models/departments_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var cubit = MedicalCubit.get(context);

    List<String> covers = [
      'assets/images/cover1.jpg',
      'assets/images/cover2.jpg'
    ];

    List<String> resourcesImages =[
      'assets/images/resources1.jpg',
      'assets/images/resources2.jpg',
      'assets/images/resources3.jpg',
    ];
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CarouselSlider(
                items: covers.map((e) =>
                    Stack(
                      alignment: Alignment.bottomLeft,
                      fit: StackFit.passthrough,
                        children: [
                          Image(
                          image: AssetImage(e),
                          fit: BoxFit.cover,
                        ),
                          if (e == covers[0])
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: const [
                                    Text(
                                      'SPECIALISTS',
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text(
                                      '20 YEARS CARING ABOUT YOU',
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                   SizedBox(height: 10.0,),
                                   Text(
                                      'We are located in New York',
                                        style:TextStyle(
                                         color: Colors.white,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline
                                      ),
                                    ),
                                   SizedBox(height: 10.0,),
                                 ],
                              ),
                            ),
                          if (e == covers[1])
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(height: 10.0,),
                                  Text(
                                    'MEDICAL APPOINTMENT',
                                    style:TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                    'SCHEDULE A MEDICAL APPOINTMENT NOW ',
                                    style:TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text(
                                    'Online or Over the Phone',
                                    style:TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                ).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 6),
                  viewportFraction: 1.0,
                ),),
            const SizedBox(height: 15,),
            const Text(
              'About us',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Expanded(
                      child: Column(
                        children: [
                          Text(
                            dummyText,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 20,),
                          basicButton(
                            title: 'read more',
                            onPressed: (){
                              navigateTo(context, AboutUsScreen());
                            }
                          ),
                        ],
                      ),
                  ),
                    const SizedBox(width: 10.0,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0) ,
                      child: const Image(
                       image: AssetImage('assets/images/about_us.jpg',),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,

                      ),
                  ),
                ],
              ),
            ),
            myDivider(),
            const Text(
              'Departments',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            const SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.symmetric( horizontal: 15.0),
              height: 120,
              child: ListView.separated(
                itemBuilder: (context,index) => buildDepartmentItem(cubit.departments[index],context),
                separatorBuilder: (context,index) => const SizedBox(width: 10.0,),
                itemCount: cubit.departments.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(height: 20.0,),
            basicButton(
                onPressed: (){
                  cubit.changeNavBar(1);
                },
                title: 'View More',
            ),
            myDivider(),
            const Text(
              'Doctors',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            const SizedBox(height: 15.0,),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 1 / 1.7 ,
              children: List.generate(cubit.doctors.length, (index) => buildDoctorItem(cubit.doctors[index],context))
            ),
            const SizedBox(height: 10.0,),
            basicButton(
              onPressed: (){
                cubit.changeNavBar(2);
              },
              title: 'All Doctors',
            ),
            myDivider(),
            const Text(
              'Resources',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            const SizedBox(height: 15.0,),
            CarouselSlider(
                items: resourcesImages.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0,),
                      Image(
                        image: AssetImage(e),
                      ),
                      const SizedBox(height: 15.0,),
                      if (e==resourcesImages[1])
                        const Text(
                          'Prepare for visit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                          ),
                        ),
                      if (e==resourcesImages[2])
                        const Text(
                          'Surgery process',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                        ),
                      if (e==resourcesImages[0])
                        const Text(
                          'Patients',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),
                        ),
                      const SizedBox(height: 10.0,),
                      Text(dummyText,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ],
                  ),
                )
                ).toList(),
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlay: false,
                ),
            ),
            const SizedBox(height: 20.0,),
            basicButton(
                onPressed: (){
                  cubit.changeNavBar(3);
                },
                title: 'View more'),
            myDivider(),
            const Text(
              'Insurance',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40
              ),
            ),
            const SizedBox(height: 10.0,),
            GridView.count(
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 3,
              mainAxisSpacing: 1.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:  const [
                Image(image: AssetImage('assets/images/insurance1.png'),),
                Image(image: AssetImage('assets/images/insurance2.png'),),
                Image(image: AssetImage('assets/images/insurance3.png'),),
                Image(image: AssetImage('assets/images/insurance4.png'),),
                Image(image: AssetImage('assets/images/insurance5.png'),),
                Image(image: AssetImage('assets/images/insurance6.png'),),
              ],
            ),
            const SizedBox(height: 20.0,),
            Container(
              // height: 200,
              width: double.infinity,
              color: Colors.blueGrey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    const SizedBox(height: 20.0,),
                    Text(
                      'Location',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'Porto Medical ,123 Porto Blvd ,\nSuite 100 ,New York, NY\nPhone : 123-456-7890',
                      style:TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Opining Hours',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'Mon-Fri  :  8:30 am to 5:00 pm\nSaturday  :  9:30 am to 1:00 pm\nSunday  :  Closed',
                      style:TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Emergency Cases',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      '(800)123-4567',
                      style:TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(
                      'Social Media',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 35.0,
                          width: 35.0,
                          color: Colors.white,
                          child: IconButton(
                            onPressed: () {  },
                            icon: SvgPicture.asset('assets/svg/facebook.svg'),
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          color: Colors.white,
                          child: IconButton(
                              onPressed: (){},
                              icon: SvgPicture.asset('assets/svg/twitter.svg',),
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          color: Colors.white,
                          child: IconButton(
                              onPressed: (){},
                              icon: SvgPicture.asset('assets/svg/linkedin.svg')
                          ),
                        ),
                        const SizedBox(width: 8.0,),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
   Widget buildDepartmentItem(DepartmentsModel model,context) {
     return Container(
       width: 120,
       decoration: BoxDecoration(
         color: Colors.lightBlue[100],
         borderRadius: BorderRadius.circular(20.0)
       ),
       child: GestureDetector(
         onTap: (){
           Widget departmentWidget = MedicalCubit.get(context).buildDepartmentDetailsScreen(model);
           navigateTo(context, departmentWidget);
         },
         behavior: HitTestBehavior.opaque,
         child: Column(
           children:  [
             Padding(
               padding: const EdgeInsets.only(top: 6.0),
               child: Image(image: AssetImage(
                   model.image,
               ),
                 height: 75.0,
                 width: 75.0,
               ),
             ),
             const SizedBox(height: 10.0,),
             Text(model.name,
               style: const TextStyle(
                  color: Colors.blue,
                   fontWeight: FontWeight.bold
               ),
             )
           ],),
       ),
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
