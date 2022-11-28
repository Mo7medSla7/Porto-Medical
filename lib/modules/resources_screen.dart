import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/modules/contact_us_screen.dart';
import 'package:medical_app/shared/colors.dart';
import 'package:medical_app/shared/components.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> resourcesImages =[
      'assets/images/resources1.jpg',
      'assets/images/resources2.jpg',
      'assets/images/resources3.jpg',
    ];
    List<String> resourcesNames =[
      'Patients',
      'Prepare for visit',
      'Surgery proccess',
    ];

    return ListView.separated(
        itemBuilder: (context,index)=>buildResourceItem(resourcesImages[index],resourcesNames[index],context),
        separatorBuilder:(context,index) => myDivider(),
        itemCount: resourcesImages.length);
  }

  Widget buildResourceItem(String image,String name,context)=>
      Padding(
        padding: const EdgeInsets.all(20.0).copyWith(bottom: 0),
        child: Column(
          children: [
            Image(image: AssetImage(image),),
            const SizedBox(height: 8.0,),
            Text(
              name,
              style: const TextStyle(
                color: defaultColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0,),
            Text(dummyText),
            const SizedBox(height: 8.0,),
            basicButton(
                onPressed: (){
                  Widget resourcePage = buildResourcePage(name,image,context);
                  navigateTo(context, resourcePage);
                },
                title: 'view more')
          ],
        ),
      );

  Widget buildResourcePage(String name ,String image,context)=>
  Scaffold(
    appBar: AppBar(
       title:  const Text('Resources info',
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
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8.0,),
          const Text(
            'Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris.',
            style:  TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15.0,),
          DropCapText(
            dummyText+dummyText,
            dropCapPosition: DropCapPosition.end,
            textAlign: TextAlign.justify,
            dropCap: DropCap(
                width: 180,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,),
                  child: Image(
                    image :AssetImage(image),
                  ),
                ),
            ),
          ),
          const SizedBox(height: 20.0,),
          const Text(
            'What to Bring',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: defaultColor,
            ),
          ),
          const SizedBox(height: 8.0,),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: const [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 15,
                      color: defaultColor,
                    ),
                    SizedBox(width: 6.0,),
                    Text('Medical recs'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    // SizedBox(width: 6.0,),
                    Icon(
                      Icons.check_circle_rounded,
                      size: 15,
                      color: defaultColor,
                    ),
                    SizedBox(width: 6.0,),
                    Text('Lorem ipsum'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: const [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 15,
                      color: defaultColor,
                    ),
                    SizedBox(width: 6.0,),
                    Text('Dolor si'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0,),
          const Text(
            '"Health is the most important thing you have in life!"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
            ),
          const SizedBox(height: 8.0,),
          const Text(
            'Contact us now to schedule an appointment.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
            ),
          const SizedBox(height: 8.0,),
          basicButton(
              onPressed: (){
                navigateTo(context, const ContactUsScreen());
              },
              title: 'Contact Us')
        ],
      ),
    ),
  );
}
