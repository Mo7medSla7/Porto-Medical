import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/modules/contact_us_screen.dart';
import 'package:medical_app/shared/colors.dart';
import 'package:medical_app/shared/components.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String aboutUs = 'Founded in 2001 by John Doe, gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat consequat.';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About us',
          style: TextStyle(
            color: defaultColor,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: defaultColor,
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: defaultColor,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to Porto Medical',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                aboutUs,
                style: const TextStyle(
                  fontSize: 16
                ),
              ),
              const SizedBox(height: 20.0,),
              Text(
                dummyText+dummyText+dummyText,
                style: const TextStyle(
                  fontSize: 14
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          '15',
                          style:TextStyle(
                            color: defaultColor,
                            fontSize: 56,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(
                          'Years in Business',
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          '12',
                          style:TextStyle(
                            color: defaultColor,
                            fontSize: 56,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(
                          'Departments',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          '16',
                          style:TextStyle(
                            color: defaultColor,
                            fontSize: 56,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(
                          'Insurance',
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    'Payment Options',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Text(dummyText),
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
                    'Appointments',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Text(dummyText),
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
                    'Accepted Insurance Plans',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Text(dummyText),
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
                    'Policies',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
              Text(dummyText),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  basicButton(
                      onPressed: (){
                        navigateTo(context, const ContactUsScreen());
                      },
                      title: 'Contact us'
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
